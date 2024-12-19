import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryChip extends StatelessWidget {
  final Category category;

  CategoryChip({required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Chip(
        label: Text(category.name),
        backgroundColor: Colors.teal.shade100,
      ),
    );
  }
}
