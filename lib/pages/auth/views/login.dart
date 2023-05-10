import 'package:binus_smart/config/colors.dart';
import 'package:binus_smart/config/router.dart';
import 'package:binus_smart/config/storage.dart';
import 'package:binus_smart/models/user.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final String _apiUrl = 'https://fakestoreapi.com/auth/login';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _storage = storage;
  bool _isLoading = false;
  bool _isError = false;

  void login(String username, String password, BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    try {
      Response response = await Dio().post(
        _apiUrl,
        data: {
          'username': username,
          'password': password,
        },
      );
      final jwt = JWT.decode(response.data['token'] ?? '');
      response = await Dio().get(
        'https://fakestoreapi.com/users/${jwt.payload['sub']}',
      );
      User user = User.fromJson(response.data);
      await _storage.write(
        key: 'id',
        value: user.id.toString(),
      );
      await _storage.write(
        key: 'firstName',
        value: user.name.firstname,
      );
      setState(() {
        _isLoading = false;
      });
      if (context.mounted) {
        Routes.router.navigateTo(context, 'home', replace: true);
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _isError = true;
      });
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(59, 126, 186, 1),
            Color.fromRGBO(47, 103, 153, 1),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      alignment: Alignment.center,
      child: FittedBox(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          width: 262.5,
          child: Column(
            children: [
              const SizedBox(
                height: 22.5,
              ),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        style: const TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          hintText: 'Email',
                          isDense: true,
                          contentPadding: const EdgeInsets.all(10),
                          hintStyle: TextStyle(
                            color: _isError ? merah : Colors.grey,
                          ),
                          fillColor: Colors.white30,
                          filled: true,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          enabledBorder: _isError
                              ? OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: merah,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                )
                              : const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 8.5),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        obscureText: true,
                        style: const TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          isDense: true,
                          contentPadding: const EdgeInsets.all(10),
                          hintStyle: TextStyle(
                            color: _isError ? merah : Colors.grey,
                          ),
                          fillColor: Colors.white30,
                          filled: true,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          enabledBorder: _isError
                              ? OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: merah,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                )
                              : const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 24.5),
                      _isError
                          ? SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Email or password is invalid',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: merah,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : const SizedBox(),
                      _isError ? const SizedBox(height: 4) : const SizedBox(),
                      _isLoading
                          ? const SizedBox(
                              width: double.infinity,
                              child: LinearProgressIndicator(),
                            )
                          : ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  login(
                                    _usernameController.text,
                                    _passwordController.text,
                                    context,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: jingga,
                              ),
                              child: const SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'Login',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 13),
              const Text(
                '© 2023 BINUSMART',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 26.5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
