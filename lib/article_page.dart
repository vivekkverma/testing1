import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  final dynamic article;

  const ArticlePage({required this.article});

  String _truncateSummary(String summary) {
    final words = summary.split(' ');
    if (words.length <= 160) {
      return summary;
    }
    final truncatedWords = words.sublist(0, 150);
    return truncatedWords.join(' ') + '...';
  }

  String _extractHeadline(String title) {
    final parts = title.split(' - ');
    if (parts.length > 1) {
      return parts[0];
    }
    return title;
  }

  @override
  Widget build(BuildContext context) {
    final headline = _extractHeadline(article['title']);

    return Scaffold(
      appBar: AppBar(
        title: Text('Article'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                article['urlToImage'],
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              headline,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              _truncateSummary(article['description']),
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
