import 'package:binus_smart/config/colors.dart';
import 'package:flutter/material.dart';

class Jumbotron extends StatelessWidget {
  const Jumbotron({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(47, 23.5, 47, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              const Color.fromRGBO(39, 182, 79, 1),
              ijo,
            ],
          ),
        ),
        height: 191,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            const Text(
              '30% OFF - Ramadhan Sale',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4.5),
            const Text(
              '*promotion is valid for regular-priced items, except for special collections.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 14),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(56.5, 10.5, 56.5, 10.5),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'BUY NOW',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
