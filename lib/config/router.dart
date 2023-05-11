import 'package:binus_smart/pages/auth/auth.dart';
import 'package:binus_smart/pages/cart/cart.dart';
import 'package:binus_smart/pages/category/category.dart';
import 'package:binus_smart/pages/detail/detail.dart';
import 'package:binus_smart/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static final router = FluroRouter();
  static dynamic defineRoutes() {
    router.define(
      "home",
      handler: Handler(
        handlerFunc: (
          BuildContext? context,
          Map<String, dynamic> params,
        ) {
          return const Home();
        },
      ),
    );
    router.define(
      "auth/:mode",
      handler: Handler(
        handlerFunc: (
          BuildContext? context,
          Map<String, dynamic> params,
        ) {
          return Auth(params['mode'][0]);
        },
      ),
    );
    router.define(
      "detail/:id",
      handler: Handler(
        handlerFunc: (
          BuildContext? context,
          Map<String, dynamic> params,
        ) {
          return Detail(params['id'][0]);
        },
      ),
    );
    router.define(
      'category',
      handler: Handler(
        handlerFunc: (
          BuildContext? context,
          Map<String, dynamic> params,
        ) {
          return const Category();
        },
      ),
    );
    router.define(
      'cart',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          return const Cart();
        },
      ),
    );
  }
}
