import 'package:binus_smart/config/colors.dart';
import 'package:flutter/material.dart';

class ResultCategory extends StatefulWidget {
  final List<String> category;
  final String selectedCategory;
  const ResultCategory(this.category, this.selectedCategory, {super.key});

  @override
  State<ResultCategory> createState() => _ResultCategoryState();
}

class _ResultCategoryState extends State<ResultCategory> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
