import 'package:flutter/material.dart';
import 'category_card.dart';
//import 'news_page.dart';

class CategoriesPage extends StatelessWidget {
  final String category;
  final List<Map<String, dynamic>> articles;

  CategoriesPage({required this.category, required this.articles});
  final List<Map<String, String>> categories = [
    {
      'category': 'Business',
      'image':
          'https://st.depositphotos.com/1776223/2024/i/950/depositphotos_20243063-stock-photo-a-hand-holding-a-fan.jpg',
    },
    {
      'category': 'Health',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTaCep4PcqSpssotFl08L8j9TNlE0WrYZdP_Ej6BjW-RXArQoFO',
    },
    {
      'category': 'Entertainment',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTj8smVeHddjHD8AlOmvVx7CEX8t_nS81iW-UamtjKkG-q5BMi8',
    },
    {
      'category': 'General',
      'image':
          'https://66.media.tumblr.com/3e368d4f495ab3e07b0c7114955b48dc/tumblr_mz8od094wc1rtp2uuo1_500.jpg',
    },
    {
      'category': 'Science',
      'image':
          'https://c.wallhere.com/photos/34/7f/nature_photography_portrait_display-36961.jpg!d',
    },
    {
      'category': 'Sports',
      'image':
          'https://images.unsplash.com/photo-1521412644187-c49fa049e84d?ixlib=rb-1.2.1&w=1000&q=80',
    },
    {
      'category': 'Technology',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSs77jFDj9CMVP5ixm7ryIB2WPbUkGRAHBclciGzQYhxq_Dz-IU',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 1.0,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index]['category'];
          final imageUrl = categories[index]['image'];
          return CategoryCard(
            category: category!,
            imageUrl: imageUrl!,
          );
        },
      ),
    );
  }
}
