import 'package:flutter/material.dart';

class MyError extends StatelessWidget {
  const MyError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text('Oops, something went wrong :('),
      );
  }
}