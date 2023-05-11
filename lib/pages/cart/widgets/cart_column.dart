import 'package:binus_smart/config/colors.dart';
import 'package:binus_smart/models/cart.dart';
import 'package:flutter/material.dart';

class CartColumn extends StatelessWidget {
  final int index;
  final CartModel cart;
  const CartColumn(this.cart, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 29.5,
            horizontal: 32.5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cart ${index + 1}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                cart.date,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: abu2_2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
