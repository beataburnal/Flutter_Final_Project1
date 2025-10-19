import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> news = [
      'Top Stories',
      'World',
      'Business',
      'Technology',
      'Entertainment',
      'Sports',
      'Science',
      'Health',
    ];

    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Bea Taburnal"),
            accountEmail: Text("beataburnal.com"),
            currentAccountPicture: CircleAvatar( 
            ),
          ),
          ListTile(
            leading: const Icon(Icons.store),
            title: const Text('Shop'),
            onTap: () => Navigator.pushNamed(context, '/shop'),
          ),
          ListTile(
            leading: const Icon(Icons.newspaper),
            title: const Text('Newsstand'),
            onTap: () {
              Navigator.pushNamed(context, '/newsstand', arguments: {'news': news});
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Who we are'),
            onTap: () => Navigator.pushNamed(context, '/info'),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('My Profile'),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Basket'),
            onTap: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
    );
  }
}
