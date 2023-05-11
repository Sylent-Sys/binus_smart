import 'package:binus_smart/config/colors.dart';
import 'package:binus_smart/models/cart.dart';
import 'package:binus_smart/pages/cart/widgets/cart_column.dart';
import 'package:flutter/material.dart';

class ResultCart extends StatelessWidget {
  final List<CartModel> carts;
  final double grandTotal;
  const ResultCart(this.carts, this.grandTotal, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < carts.length; i++) CartColumn(carts[i], i),
        Card(
          color: biru,
          child: SizedBox(
            height: 125,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 48.5,
                vertical: 9,
              ),
              child: Row(
                children: [
                  const Spacer(),
                  const Text(
                    'Grand Total',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Text(
                    '\$$grandTotal',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
