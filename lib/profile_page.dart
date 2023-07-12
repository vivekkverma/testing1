import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isDarkModeEnabled = false;
  bool areNotificationsEnabled = true;

  void _toggleDarkMode(bool value) {
    setState(() {
      isDarkModeEnabled = value;
    });
  }

  void _toggleNotifications(bool value) {
    setState(() {
      areNotificationsEnabled = value;
    });
  }

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
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: isDarkModeEnabled,
              onChanged: _toggleDarkMode,
            ),
          ),
          ListTile(
            title: Text('Notifications'),
            trailing: Switch(
              value: areNotificationsEnabled,
              onChanged: _toggleNotifications,
            ),
          ),
        ],
      ),
    );
  }
}
