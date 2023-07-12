import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String category;

  const CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: () {
          // Handle category card tap
        },
        child: Center(
          child: Text(
            category,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
