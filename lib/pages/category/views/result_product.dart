import 'package:binus_smart/config/extension.dart';
import 'package:binus_smart/models/product.dart';
import 'package:binus_smart/pages/global/views/state_condition.dart';
import 'package:binus_smart/pages/home/widgets/my_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ResultProduct extends StatefulWidget {
  final String selectedCategory;
  const ResultProduct(this.selectedCategory, {super.key});

  @override
  State<ResultProduct> createState() => _ResultProductState();
}

class _ResultProductState extends State<ResultProduct> {
  bool _isLoading = true;
  bool _isError = false;
  List<Product> _products = [];
  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  void didUpdateWidget(covariant ResultProduct oldWidget) {
    super.didUpdateWidget(oldWidget);
    getProducts();
  }

  void getProducts() async {
    setState(() {
      _isLoading = true;
      _isError = false;
    });
    try {
      Response response = await Dio().get(
        Uri.encodeFull(
          'https://fakestoreapi.com/products/category/${widget.selectedCategory}',
        ),
      );
      setState(() {
        _products =
            List<Product>.from(response.data.map((e) => Product.fromJson(e)));
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(47, 43, 47, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.selectedCategory.sentencesCase(),
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (!_isLoading && !_isError)
                Text(
                  '${_products.length} Result',
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
          widget: MyCard(_products),
        ),
      ],
    );
  }
}
