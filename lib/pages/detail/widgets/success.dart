import 'package:binus_smart/config/colors.dart';
import 'package:binus_smart/models/product.dart';
import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  final Product _product;
  const Success(this._product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              _product.image,
              width: 200,
              height: 200,
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 200 - 30 - 94 - 16 - 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _product.category,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: abu2_2,
                ),
              ),
              Text(
                _product.title,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '\$${_product.price}',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                _product.description,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
