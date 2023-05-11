import 'package:binus_smart/config/router.dart';
import 'package:binus_smart/models/product.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard(this._products, {super.key});
  final List<ProductModel> _products;
  @override
  Widget build(BuildContext context) {
    double calculateSpacingWith({
      required double width,
      required double tileWidth,
      required double minSpacing,
    }) {
      final tilesInRow =
          ((width + minSpacing) / (tileWidth + minSpacing)).floor();
      if (tilesInRow <= 1) {
        return 0;
      }

      final spacing =
          ((width - tileWidth * tilesInRow) / (tilesInRow - 1)).floorToDouble();
      return spacing;
    }

    double calculateSpacing() {
      return calculateSpacingWith(
        width: MediaQuery.of(context).size.width,
        tileWidth: 180,
        minSpacing: 5,
      );
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 23.5, bottom: 23.5),
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: calculateSpacing(),
          runSpacing: calculateSpacing(),
          children: <Widget>[
            for (var index = 0; index < _products.length; index++)
              GestureDetector(
                onTap: () {
                  Routes.router.navigateTo(
                    context,
                    '/detail/${_products[index].id}',
                    replace: true,
                  );
                },
                child: Card(
                  child: SizedBox(
                    width: 160,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(
                            _products[index].image,
                            width: 121.5,
                            height: 127.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _products[index].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  '\$${_products[index].price}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
