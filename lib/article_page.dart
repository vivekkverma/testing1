import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  final dynamic article;

  const ArticlePage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article'),
      ),
      body: Column(
        children: [
          Image.network(article['urlToImage']),
          Text(article['title']),
          Text(article['description']),
          // Add more article details here
        ],
      ),
    );
  }
}
