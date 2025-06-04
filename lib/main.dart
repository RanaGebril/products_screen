import 'package:flutter/material.dart';
import 'package:products_screen/products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ProductsScreen.route_name,
      routes: {
        ProductsScreen.route_name : (context) => ProductsScreen()
      },
    );
  }
}
