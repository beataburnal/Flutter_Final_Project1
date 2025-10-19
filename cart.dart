import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cart = cartProvider.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket'),
        actions: const [Icon(Icons.shopping_basket)],
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];
                return ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: Text(item.product.name),
                  subtitle: Text(
                      '\$${item.product.price.toStringAsFixed(2)} x ${item.quantity}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle, color: Colors.red),
                    onPressed: () {
                      cartProvider.removeItem(item.product.id);
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.green[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total:', style: TextStyle(fontSize: 18)),
                Text(
                  '\$${cartProvider.totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
