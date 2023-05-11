import 'package:binus_smart/config/colors.dart';
import 'package:binus_smart/models/product.dart';
import 'package:binus_smart/pages/global/views/state_condition.dart';
import 'package:binus_smart/pages/home/widgets/my_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  final String _apiUrl = 'https://fakestoreapi.com/products';
  List<ProductModel> _products = [];
  bool _isLoading = true;
  bool _isError = false;

  void getApiData(BuildContext context) async {
    try {
      Response response = await Dio().get(_apiUrl);
      setState(() {
        List<dynamic> data = response.data;
        List<ProductModel> products = data.map((e) => ProductModel.fromJson(e)).toList();
        _products = products;
        _isLoading = false;
      });
    } catch (e) {
      if (context.mounted) {
        setState(() {
          _isError = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    getApiData(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(47, 23.5, 47, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'All Products',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (!_isLoading && !_isError)
                Text(
                  '${_products.length} Result',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: abu2_2,
                  ),
                )
            ],
          ),
        ),
        StateCondition(
          isError: _isError,
          isLoading: _isLoading,
          widget: MyCard(_products),
        )
      ],
    );
  }
}
