import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Shopping Cart"),
        backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: 'Enter item'),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  cart.addItem(controller.text);
                  controller.clear();
                }
              },
              child: const Text("Add to Cart"),
            ),
            const SizedBox(height: 20),
            const Text("Cart Items:", style: TextStyle(fontSize: 18)),
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (_, index) => ListTile(
                  title: Text(cart.items[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
