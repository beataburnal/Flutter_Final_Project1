import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_drawer.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Who we are'),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset("assets/images/basket.png", height: 150),
            const SizedBox(height: 20),
            const Text(
              "Hello,Fellow My Grocery — delivering fresh food at your doorstep. "
              "Quality, convenience, and great service are what we stand for.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
