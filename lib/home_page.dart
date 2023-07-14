import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'article_page.dart';
import 'news_card.dart';
import 'taskbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> newsArticles = [];

  @override
  void initState() {
    super.initState();
    fetchNewsArticles();
  }

  Future<void> fetchNewsArticles() async {
    final response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=3c965853bfa44560a63fe241117a5d4e'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'P.I.G.E.O.N.',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: newsArticles.length,
              itemBuilder: (context, index) {
                final article = newsArticles[index];
                final imageUrl = article['urlToImage'];
                final headline = article['title'];

                if (imageUrl == null || headline == null) {
                  return Container();
                }

                return NewsCard(
                  imageUrl: imageUrl,
                  headline: headline,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticlePage(article: article),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          TaskBar(),
        ],
      ),
    );
  }
}
