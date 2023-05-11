import 'package:binus_smart/config/colors.dart';
import 'package:binus_smart/config/router.dart';
import 'package:binus_smart/config/storage.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();

  @override
  Size get preferredSize => const Size.fromHeight(79);
}

class _NavbarState extends State<Navbar> {
  final _storage = storage;
  bool _isAuth = false;
  String _firstName = '';
  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  void checkAuth() async {
    try {
      String? firstName = await _storage.read(key: 'firstName');
      setState(() {
        _isAuth = firstName != null && firstName.isNotEmpty;
        _firstName = firstName ?? '';
      });
    } catch (e) {
      setState(() {
        _isAuth = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2.5,
            blurRadius: 2.5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
          padding: const EdgeInsets.fromLTRB(47, 25, 47, 25),
          child: Row(
            children: [
              TextButton(
                onPressed: () {
                  Routes.router.navigateTo(context, 'home', replace: true);
                },
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 24),
                    children: [
                      TextSpan(
                          text: 'BINUS',
                          style: TextStyle(
                              color: jingga, fontWeight: FontWeight.w900)),
                      const TextSpan(
                          text: 'MART',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w700))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 46.5,
              ),
              TextButton(
                onPressed: () {
                  Routes.router.navigateTo(context, 'category', replace: true);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                ),
                child: Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: abu2_2,
                  ),
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              TextButton(
                onPressed: () {
                  Routes.router.navigateTo(context, 'cart', replace: true);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                ),
                child: Text(
                  'Cart',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: abu2_2,
                  ),
                ),
              ),
              const Spacer(),
              _isAuth
                  ? TextButton(
                      onPressed: () async {
                        await storage.deleteAll();
                        setState(() {
                          _isAuth = false;
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: jingga,
                      ),
                      child: Text(
                        'Halo, $_firstName',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: jingga),
                      ),
                    )
                  : TextButton(
                      onPressed: () {
                        Routes.router
                            .navigateTo(context, 'auth/login', replace: true);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: jingga,
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: jingga),
                      ),
                    )
            ],
          )),
    );
  }
}
