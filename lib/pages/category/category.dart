import 'package:binus_smart/config/colors.dart';
import 'package:binus_smart/config/extension.dart';
import 'package:binus_smart/pages/category/views/result_product.dart';
import 'package:binus_smart/pages/global/views/footer.dart';
import 'package:binus_smart/pages/global/views/navbar.dart';
import 'package:binus_smart/pages/global/views/state_condition.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<String> _category = [];
  String _selectedCategory = '';
  bool _isLoading = true;
  bool _isError = false;
  @override
  void initState() {
    super.initState();
    getCategory();
  }

  void getCategory() async {
    try {
      Response response =
          await Dio().get('https://fakestoreapi.com/products/categories');
      setState(() {
        _category = List<String>.from(response.data);
        _selectedCategory = _category.first;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(47, 30, 47, 0),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        const Color.fromRGBO(59, 126, 186, 1),
                        biru,
                      ],
                    ),
                  ),
                  height: 122.5,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Category',
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        _isError
                            ? const Text(
                                'Oops, something went wrong :(',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 94.5, 0, 0),
                    child: SizedBox(
                      height: 55,
                      child: StateCondition(
                        isLoading: _isLoading,
                        isError: _isError,
                        showError: false,
                        widget: Row(
                          children: [
                            for (var i = 0; i < _category.length; i++)
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedCategory = _category[i];
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: _selectedCategory == _category[i]
                                            ? jingga
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2.5,
                                            blurRadius: 2.5,
                                            offset: const Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      height: 55,
                                      child: Center(
                                        child: Text(
                                          _category[i].sentencesCase(),
                                          style: TextStyle(
                                            color: _selectedCategory ==
                                                    _category[i]
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          StateCondition(
            isLoading: _isLoading,
            isError: _isError,
            showError: false,
            showLoading: false,
            widget: ResultProduct(_selectedCategory),
          ),
        ],
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
