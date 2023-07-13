import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  final String category;

  const NewsPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Center(
        child: Text('Display news for $category here'),
      ),
    );
  }
}
