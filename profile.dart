import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_drawer.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile")),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(radius: 50, backgroundImage: AssetImage("assets/beya/apple.png")),
            SizedBox(height: 16),
            Text("Bea Taburnal", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("beataburnal.com", style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
