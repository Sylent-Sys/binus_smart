import 'package:binus_smart/pages/global/views/footer.dart';
import 'package:binus_smart/pages/global/views/navbar.dart';
import 'package:binus_smart/pages/home/widgets/jumbotron.dart';
import 'package:binus_smart/pages/home/views/result.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: ListView(
        children: const [
          Jumbotron(),
          Result(),
        ],
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
