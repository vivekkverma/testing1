import 'package:flutter/material.dart';

class CategoryBlock extends StatelessWidget {
  final ImageProvider image;
  final VoidCallback onTap;

  const CategoryBlock({
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Image(image: image),
      ),
    );
  }
}
