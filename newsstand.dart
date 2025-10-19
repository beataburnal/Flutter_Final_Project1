import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_drawer.dart';

class Newsstand extends StatelessWidget {
  const Newsstand({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final List<String> news = args?['news'] ?? ['No news available'];

    return Scaffold(
      appBar: AppBar(title: const Text('Newsstand')),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            elevation: 2,
            child: ListTile(
              leading: const Icon(Icons.article, color: Colors.blue),
              title: Text(news[index]),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
