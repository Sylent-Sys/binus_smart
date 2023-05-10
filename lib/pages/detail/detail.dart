import 'package:binus_smart/pages/detail/view/result.dart';
import 'package:binus_smart/pages/global/views/footer.dart';
import 'package:binus_smart/pages/global/views/navbar.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail(this._id, {super.key});
  final String _id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 47,
          vertical: 32,
        ),
        child: Result(
          id: _id,
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
