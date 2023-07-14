import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'categories_page.dart';
import 'profile_page.dart';
import 'news_page.dart';
import 'theme_notifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, _) {
        return MaterialApp(
          title: 'P.I.G.E.O.N.',
          theme: themeNotifier.currentTheme == ThemeMode.dark
              ? ThemeData.dark()
              : ThemeData.light(),
          initialRoute: '/',
          routes: {
            '/': (context) => HomePage(),
            '/categories': (context) => CategoriesPage(category: '', articles: [],),
            '/profile': (context) => ProfilePage(),
          },
        );
      },
    );
  }
}