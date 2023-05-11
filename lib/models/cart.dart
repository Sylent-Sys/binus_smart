import 'package:binus_smart/models/product.dart';

class CartModel {
  int id;
  int userId;
  String date;
  List<CartProductModel> products;
  CartModel({
    required this.id,
    required this.userId,
    required this.date,
    this.products = const [],
  });
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json["id"],
      userId: json["userId"],
      date: json["date"],
      products: List<CartProductModel>.from(
        json["products"].map(
          (x) => CartProductModel.fromJson(x),
        ),
      ),
    );
  }
}

class CartProductModel {
  int productId;
  int quantity;
  ProductModel? product;
  CartProductModel({
    required this.productId,
    required this.quantity,
  });
  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      productId: json["productId"],
      quantity: json["quantity"]
    );
  }
}
