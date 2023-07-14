import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_notifier.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 75.0),
          CircleAvatar(
            radius: 80.0,
            backgroundImage: AssetImage('assets/user_photo.jpg'),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Capstone',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 75.0),
          Consumer<ThemeNotifier>(
            builder: (context, themeNotifier, _) {
              return ListTile(
                title: Text('Dark Mode'),
                trailing: Switch(
                  value: themeNotifier.currentTheme == ThemeMode.dark,
                  onChanged: (value) {
                    final newTheme = value ? ThemeMode.dark : ThemeMode.light;
                    themeNotifier.setTheme(newTheme);
                  },
                ),
              );
            },
          ),
          ListTile(
            title: Text('Notifications'),
            trailing: Switch(
              value: false,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
