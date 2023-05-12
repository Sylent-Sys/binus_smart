import 'package:binus_smart/config/router.dart';
import 'package:binus_smart/models/product.dart';
import 'package:binus_smart/pages/detail/widgets/success.dart';
import 'package:binus_smart/pages/global/views/state_condition.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final String id;
  const Result({Key? key, required this.id}) : super(key: key);
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  ProductModel _product = ProductModel(
    id: 0,
    title: '',
    description: '',
    price: 0,
    category: '',
    image: '',
    rating: RatingModel(
      rate: 0,
      count: 0,
    ),
  );
  bool _isLoading = true;
  bool _isError = false;
  @override
  void initState() {
    super.initState();
    getDetailProduct();
  }

  void getDetailProduct() async {
    try {
      final String id = widget.id;
      Response response =
          await Dio().get('https://fakestoreapi.com/products/$id');
      setState(() {
        _product = ProductModel.fromJson(response.data);
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
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Routes.router.pop(context);
            },
            child: const FittedBox(
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 27.5,
                  ),
                  Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: StateCondition(
              isLoading: _isLoading,
              isError: _isError,
              widget: Success(_product),
            ),
          ),
        ],
      ),
    );
  }
}
