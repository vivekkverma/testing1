import 'package:flutter/material.dart';

class TaskBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              // Navigate to home page
              Navigator.pushNamed(context, '/');
            },
          ),
          IconButton(
            icon: Icon(Icons.category),
            onPressed: () {
              // Navigate to categories page
              Navigator.pushNamed(context, '/categories');
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Navigate to user profile page
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
    );
  }
}
