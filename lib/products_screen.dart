import 'package:flutter/material.dart';
import 'package:products_screen/API_maneger.dart';
import 'package:products_screen/App_colors.dart';
import 'package:products_screen/product_item.dart';

class ProductsScreen extends StatelessWidget {
  static const String route_name = "products";
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white_color,
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: ApiManager.getProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("error"));
                }
                if (!snapshot.hasData) {
                  return const Center(child: Text('No products found'));
                }

                final products = snapshot.data!;
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.714,
                  ),

                  itemBuilder: (context, index) {
                    return ProductItem(product: products[index]);
                  },
                  itemCount: products.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
