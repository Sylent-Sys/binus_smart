import 'package:binus_smart/models/cart.dart';
import 'package:binus_smart/pages/global/views/footer.dart';
import 'package:binus_smart/pages/global/views/navbar.dart';
import 'package:binus_smart/pages/global/views/state_condition.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<CartModel> _carts = [];
  bool _isLoading = true;
  bool _isError = false;
  @override
  void initState() {
    super.initState();
    getCarts();
  }

  void getCarts() async {
    try {
      Response response = await Dio().get(
        Uri.encodeFull('https://fakestoreapi.com/carts/user/1'),
      );
      setState(() {
        _carts = List<CartModel>.from(
            response.data.map((e) => CartModel.fromJson(e)));
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        print(e.toString());
        _isError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 31,
          horizontal: 47,
        ),
        child: ListView(
          children: [
            SizedBox(
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
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    )
                ],
              ),
            ),
            StateCondition(
              isLoading: _isLoading,
              isError: _isError,
              widget: const Placeholder(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
