import 'package:flutter/material.dart';
import 'news_card.dart';

class ArticlePage extends StatelessWidget {
  final dynamic article;
  final Sentiment sentiment;

  const ArticlePage({required this.article, required this.sentiment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 4.0, // Adjust the height as needed
              color: getColorForSentiment(sentiment), // Custom function to get color based on sentiment
            ),
            SizedBox(height: 16.0),
            Image.network(article['urlToImage']),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                article['title'],
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                article['description'],
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getColorForSentiment(Sentiment sentiment) {
    switch (sentiment) {
      case Sentiment.positive:
        return Colors.green;
      case Sentiment.negative:
        return Colors.red;
      case Sentiment.neutral:
      default:
        return Colors.grey;
    }
  }
}
