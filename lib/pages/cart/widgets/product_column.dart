import 'package:binus_smart/models/product.dart';
import 'package:flutter/material.dart';

class ProductColumn extends StatelessWidget {
  final ProductModel? product;
  final int quantity;
  const ProductColumn(this.product, this.quantity, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width -
          (47 * 2) -
          (4 * 2) -
          (29.5 * 2) -
          (4),
      child: Row(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.network(
                product!.image,
                width: 75,
                height: 75,
              ),
            ),
          ),
          SizedBox(
            width: 225,
            child: Text(
              product!.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            width: 450,
          ),
          SizedBox(
            width: 75,
            child: Text(
              '$quantity (pcs)',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          Text(
            "\$${product!.price}",
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
