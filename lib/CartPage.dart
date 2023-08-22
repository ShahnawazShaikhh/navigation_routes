import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<CartItem> cartItems;

  CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = widget.cartItems[index];

          return ListTile(
            leading: Image.network(cartItem.image),
            title: Text(cartItem.name),
            subtitle: Text('${cartItem.unit} Rs.${cartItem.price}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Material(
                  elevation: 10,
                  child: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (cartItem.quantity > 1) {
                          cartItem.quantity--;
                        }
                      });
                    },
                  ),
                ),
                SizedBox(width: 20),
                Text(cartItem.quantity.toString()),
                SizedBox(width: 20),
                Material(
                  elevation: 10,
                  child: IconButton(
                    iconSize: 24,
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        cartItem.quantity++;
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(100),
        child: Text(
          'Total Price: Rs.${calculateTotalPrice(widget.cartItems)}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  int calculateTotalPrice(List<CartItem> cartItems) {
    int total = 0;
    for (final cartItem in cartItems) {
      total += cartItem.price * cartItem.quantity;
    }
    return total;
  }
}

class CartItem {
  final String name;
  final String unit;
  final int price;
  final String image;
  int quantity;

  CartItem({
    required this.name,
    required this.unit,
    required this.price,
    required this.image,
    this.quantity = 1, // Default quantity is 1
  });
}
