import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_drawer.dart';
import 'package:flutter_application_1/provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/product.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    final List<Product> products = [
      Product(id: '1', name: 'durian', vendor: 'Fresh Farm', price: 2.5),
      Product(id: '2', name: 'chico', vendor: 'Tropical Ltd.', price: 1.5),
      Product(id: '3', name: 'squash', vendor: 'DairyBest', price: 3.0),

      Product(id: '4', name: 'durian', vendor: 'Fresh Farm', price: 2.5),
      Product(id: '5', name: 'chico', vendor: 'Tropical Ltd.', price: 1.5),
      Product(id: '6', name: 'squash', vendor: 'DairyBest', price: 3.0),

      Product(id: '7', name: 'durian', vendor: 'Fresh Farm', price: 2.5),
      Product(id: '8', name: 'chico', vendor: 'Tropical Ltd.', price: 1.5),
      Product(id: '9', name: 'squash', vendor: 'DairyBest', price: 3.0),

      Product(id: '10', name: 'durian', vendor: 'Fresh Farm', price: 2.5),
      Product(id: '11', name: 'chico', vendor: 'Tropical Ltd.', price: 1.5),
      Product(id: '12', name: 'squash', vendor: 'DairyBest', price: 3.0),

      Product(id: '13', name: 'durian', vendor: 'Fresh Farm', price: 2.5),
      Product(id: '14', name: 'chico', vendor: 'Tropical Ltd.', price: 1.5),
      Product(id: '15', name: 'squash', vendor: 'DairyBest', price: 3.0),



    ];

    final Map<String, String> productImages = {
      '1': 'assets/images/durian.jpg',
      '2': 'assets/images/chico.jpg',
      '3': 'assets/images/squash.jpg',

      '4': 'assets/images/durian.jpg',
      '5': 'assets/images/chico.jpg',
      '6': 'assets/images/squash.jpg',

      '7': 'assets/images/durian.jpg',
      '8': 'assets/images/chico.jpg',
      '9': 'assets/images/squash.jpg',

      '10': 'assets/images/durian.jpg',
      '11': 'assets/images/chico.jpg',
      '12': 'assets/images/squash.jpg',

      '13': 'assets/images/durian.jpg',
      '14': 'assets/images/chico.jpg',
      '15': 'assets/images/squash.jpg',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () => Navigator.pushNamed(context, '/cart'),
              ),
              if (cart.itemCount > 0)
                Positioned(
                  right: 4,
                  top: 4,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      cart.itemCount.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                )
            ],
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final p = products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  productImages[p.id]!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(p.name),
              subtitle: Text('${p.vendor} • \$${p.price.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.green),
                onPressed: () {
                  cart.addItem(p);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${p.name} added to basket')),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
