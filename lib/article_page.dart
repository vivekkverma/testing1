import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'news_card.dart';

class ArticlePage extends StatelessWidget {
  final dynamic article;
  final Sentiment sentiment;
  final int maxSummaryLength = 150;

  const ArticlePage({required this.article, required this.sentiment});

  @override
  Widget build(BuildContext context) {
    Color appBarColor = getColorForSentiment(sentiment);
    String summary = getSummary(article['description']);

    return Scaffold(
      appBar: AppBar(
        title: Text('Article'),
        backgroundColor: appBarColor,
        actions: [
          IconButton(
            onPressed: () => _openOriginalLink(article['url']),
            icon: Icon(Icons.open_in_browser),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              article['urlToImage'],
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            SizedBox(height: 0.0),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                removeSourceFromHeadline(article['title']),
                style: TextStyle(
                  fontSize: 22.0,
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

  void _openOriginalLink(String url) async {
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  String removeSourceFromHeadline(String headline) {
    final regex = RegExp(r' - (.+)$');
    final match = regex.firstMatch(headline);
    if (match != null) {
      return headline.replaceFirst(match.group(0)!, '').trim();
    }
    return headline;
  }

  String getSummary(String description) {
    String summary = description ?? '';
    if (summary.length > maxSummaryLength) {
      summary = summary.substring(0, maxSummaryLength) + '...';
    }
    return summary;
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
