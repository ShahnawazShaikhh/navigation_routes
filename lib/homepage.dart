// ignore: file_names
import 'package:flutter/material.dart';

import 'CartPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> productName = [
  'Mango',
  'Orange',
  'Grapes',
  'Banana',
  'Chery',
  'Peach',
  'Mixed Fruit Basket',
];
List<String> productUnit = [
  'KG',
  'Dozen',
  'KG',
  'Dozen',
  'KG',
  'KG',
  'KG',
];
List<int> productPrice = [80, 20, 30, 40, 50, 60, 70];
List<String> productImage = [
  'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg',
  'https://image.shutterstock.com/image-photo/orange-fruit-slices-leaves-isolated-600w-1386912362.jpg',
  'https://image.shutterstock.com/image-photo/green-grape-leaves-isolated-on-600w-533487490.jpg',
  'https://media.istockphoto.com/photos/banana-picture-id1184345169?s=612x612',
  'https://media.istockphoto.com/photos/cherry-trio-with-stem-and-leaf-picture-id157428769?s=612x612',
  'https://media.istockphoto.com/photos/single-whole-peach-fruit-with-leaf-and-slice-isolated-on-white-picture-id1151868959?s=612x612',
  'https://media.istockphoto.com/photos/fruit-background-picture-id529664572?s=612x612',
];

class _HomePageState extends State<HomePage> {
  List<CartItem> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cartItems: selectedItems),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productName.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedItems
                    .any((item) => item.name == productName[index]);

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            Image(
                              height: 100,
                              width: 100,
                              image: NetworkImage(productImage[index]),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    productName[index],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${productUnit[index]} Rs.${productPrice[index]}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (isSelected) {
                                            selectedItems.removeWhere((item) =>
                                                item.name ==
                                                productName[index]);
                                          } else {
                                            selectedItems.add(CartItem(
                                              name: productName[index],
                                              unit: productUnit[index],
                                              price: productPrice[index],
                                              image: productImage[index],
                                            ));
                                          }
                                        });
                                      },
                                      child: Text(isSelected
                                          ? 'Remove from cart'
                                          : 'Add to cart'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
