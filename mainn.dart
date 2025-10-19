import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_drawer.dart';
import 'package:flutter_application_1/cart.dart';
import 'package:flutter_application_1/info.dart';
import 'package:flutter_application_1/newsstand.dart';
import 'package:flutter_application_1/shop.dart';
import 'package:flutter_application_1/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Grocery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 15, 133, 19)),
      ),
      home: const MyHomePage(title: 'My Grocery'),

      routes: {
        '/shop': (context) => const Shop(),
        '/newsstand': (context) => const Newsstand(),
        '/info': (context) => const Info(),
        '/cart': (context) => const Cart(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Welcome to My Grocery!                   "
        "Have A Nice Day",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 10, 55, 132)),
      ),
      const SizedBox(height: 20),
      
      // Image.network(
      //   'https://cdn.pixabay.com/photo/2017/06/02/18/24/grocery-2369571_1280.jpg',
      //   width: 300,
      //   height: 200,
      //   fit: BoxFit.cover,
      // ),
    ],
  ),
),

    );
  }
}
