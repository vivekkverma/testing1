import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
          final headline = article['title'];
          final imageUrl = article['urlToImage'];

          return ListTile(
            leading:
                imageUrl != null ? Image.network(imageUrl) : Icon(Icons.image),
            title: Text(headline ?? 'No headline available'),
          );
        },
      ),
    );
  }
}

/*import 'package:flutter/material.dart';

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
*/