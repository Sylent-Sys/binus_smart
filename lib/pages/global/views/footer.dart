import 'package:binus_smart/config/colors.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: abu2,
      height: 93.5,
      child: const Center(
        child:
            Text('© 2023 BINUSMART', style: TextStyle(color: Colors.white, fontSize: 15)),
      ),
    );
  }
}
