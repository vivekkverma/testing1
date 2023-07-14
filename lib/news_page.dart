import 'package:flutter/material.dart';
import 'package:flutter_news_app/news_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'article_page.dart';

class NewsPage extends StatefulWidget {
  final String category;

  const NewsPage({required this.category});

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<dynamic> newsArticles = [];

  @override
  void initState() {
    super.initState();
    fetchNewsArticles();
  }

  Future<void> fetchNewsArticles() async {
    final response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=${widget.category}&apiKey=3c965853bfa44560a63fe241117a5d4e'),
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        newsArticles = jsonData['articles'];
      });
    } else {
      print('Failed to fetch news articles');
    }
  }

  void viewArticleDetail(dynamic article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArticlePage(
          article: article,
          sentiment: Sentiment.negative,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: ListView.builder(
        itemCount: newsArticles.length,
        itemBuilder: (context, index) {
          final article = newsArticles[index];
          final headline = removeSourceFromHeadline(article['title']);
          final imageUrl = article['urlToImage'];

          return GestureDetector(
            onTap: () => viewArticleDetail(article),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: imageUrl != null
                          ? Image.network(
                        imageUrl,
                        width: double.infinity,
                        height: 150.0,
                        fit: BoxFit.cover,
                      )
                          : Container(),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      headline ?? 'No headline available',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String removeSourceFromHeadline(String headline) {
    final regex = RegExp(r' - (.+)$');
    final match = regex.firstMatch(headline);
    if (match != null) {
      return headline.replaceFirst(match.group(0)!, '').trim();
    }
    return headline;
  }
}
