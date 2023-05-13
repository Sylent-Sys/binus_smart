import 'package:binus_smart/config/colors.dart';
import 'package:binus_smart/models/cart.dart';
import 'package:binus_smart/pages/cart/widgets/product_column.dart';
import 'package:flutter/material.dart';

class CartColumn extends StatelessWidget {
  final int index;
  final CartModel cart;
  const CartColumn(this.cart, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (var cartProduct in cart.products) {
      total += cartProduct.quantity * cartProduct.product!.price;
    }
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
                "${DateTime.parse(cart.date).year}-${DateTime.parse(cart.date).month}-${DateTime.parse(cart.date).day}",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: abu2_2,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var cartProduct in cart.products)
                    Column(
                      children: [
                        ProductColumn(
                            cartProduct.product, cartProduct.quantity),
                        const Divider(),
                      ],
                    ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Sub Total',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Text(
                        '\$$total',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
