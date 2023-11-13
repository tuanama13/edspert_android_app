import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Profile Page is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
