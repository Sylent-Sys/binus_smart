import 'package:binus_smart/config/colors.dart';
import 'package:binus_smart/config/storage.dart';
import 'package:binus_smart/models/cart.dart';
import 'package:binus_smart/models/product.dart';
import 'package:binus_smart/pages/cart/views/result_cart.dart';
import 'package:binus_smart/pages/global/views/footer.dart';
import 'package:binus_smart/pages/global/views/navbar.dart';
import 'package:binus_smart/pages/global/views/state_condition.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<CartModel> _carts = [];
  List<ProductModel> _products = [];
  double _grandTotal = 0;
  bool _isLoading = true;
  bool _isError = false;
  final FlutterSecureStorage _storage = storage;
  @override
  void initState() {
    super.initState();
    getCarts();
  }

  void getCarts() async {
    try {
      final String userId = await _storage.read(key: 'id') ?? '1';
      Response responseCarts = await Dio().get(
        Uri.encodeFull('https://fakestoreapi.com/carts/user/$userId'),
      );
      Response responseProducts = await Dio().get(
        Uri.encodeFull('https://fakestoreapi.com/products'),
      );
      setState(() {
        _carts = List<CartModel>.from(
          responseCarts.data.map(
            (x) => CartModel.fromJson(x),
          ),
        );
        _products = List<ProductModel>.from(
          responseProducts.data.map(
            (x) => ProductModel.fromJson(x),
          ),
        );
        for (var cart in _carts) {
          for (var cartProduct in cart.products) {
            cartProduct.product = _products.firstWhere(
              (product) => product.id == cartProduct.productId,
            );
            _grandTotal += cartProduct.product!.price * cartProduct.quantity;
          }
        }
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(47, 31, 47, 0),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Carts',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (!_isLoading && !_isError)
                    Text(
                      '${_carts.length} Result',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: abu2_2,
                      ),
                    )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(47, 0, 47, 31),
            child: StateCondition(
              isLoading: _isLoading,
              isError: _isError,
              widget: ResultCart(_carts, _grandTotal),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
