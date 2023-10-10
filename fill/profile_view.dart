import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          children: const [
            SizedBox(height: 120.0),
            CircleAvatar(
              child: Icon(
                Icons.face,
                size: 100.0,
              ),
              radius: 78.0,
            ),
            SizedBox(height: 8),
            Text(
              "Your name",
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}