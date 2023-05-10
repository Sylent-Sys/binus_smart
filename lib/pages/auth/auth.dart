import 'package:binus_smart/pages/auth/views/login.dart';
import 'package:binus_smart/pages/global/views/navbar.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth(this._mode, {super.key});
  final String _mode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: _mode == 'login'
          ? const Login()
          : const Center(
              child: Placeholder(),
            ),
    );
  }
}
