import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Map<String, dynamic>> productList = [
    {'productName': 'Product 1', 'productPrice': '10.00'},
    {'productName': 'Product 2', 'productPrice': '25.00'},
    {'productName': 'Product 3', 'productPrice': '15.00'},
    {'productName': 'Product 4', 'productPrice': '20.00'},
    {'productName': 'Product 5', 'productPrice': '22.00'},
    {'productName': 'Product 6', 'productPrice': '18.00'},
    {'productName': 'Product 7', 'productPrice': '25.00'},
    {'productName': 'Product 8', 'productPrice': '30.00'},
    {'productName': 'Product 9', 'productPrice': '40.00'},
    {'productName': 'Product 10', 'productPrice': '35.00'},
    {'productName': 'Product 11', 'productPrice': '15.00'},
    {'productName': 'Product 12', 'productPrice': '15.00'},
    {'productName': 'Product 13', 'productPrice': '20.00'},
    {'productName': 'Product 14', 'productPrice': '30.00'},
    {'productName': 'Product 15', 'productPrice': '35.00'}
  ];

  List<int> counters = [];
  @override
  void initState() {
    super.initState();
    counters = List.generate(productList.length, (index) => 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Lists'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(productList[index]['productName']),
              subtitle:
                  Text('\$${productList[index]['productPrice'].toString()}'),
              trailing: FittedBox(
                child: Column(
                  children: [
                    Text('Counter: ${counters[index]}'),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          counters[index]++;
                        });

                        if (counters[index] == 5) {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: Text('Congratulations!'),
                                  content: Text(
                                      'You\'ve bought 5 ${productList[index]['productName']}!'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('OK'))
                                  ],
                                );
                              });
                        }
                      },
                      child: Text('Buy Now'),
                    ),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          List<int> newList = [];
          for (int i = 0; i < counters.length; i++) {
            if (counters[i] > 0) {
              newList.add(i);
            }
          }
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => CartPage(totalCart: newList.length)));
        },
        child: Icon(Icons.shopping_cart_checkout),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final totalCart;
  CartPage({super.key, required this.totalCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Total Products: $totalCart'),
      ),
    );
  }
}
