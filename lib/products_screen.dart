import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_screen/main.dart';
import 'package:products_screen/product_item.dart';
import 'package:products_screen/repo/products_local_impl.dart';
import 'package:products_screen/repo/products_remote_impl.dart';
import 'bloc/cubit.dart';
import 'bloc/cubit_states.dart';

class ProductsScreen extends StatelessWidget {
  static const String route_name = "products";
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        // check internet connection
        create:
            (context) => ProductsCubit(
              isConnected ? ProductsRemoteImpl() : ProductsLocalImpl(),
            )..getProducts(),
        child: BlocBuilder<ProductsCubit, ProductsScreenStates>(
          builder: (context, state) {
            if (state is GetProductsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetProductsErrorState) {
              return const Center(child: Text("Error loading products"));
            }
            if (ProductsCubit.get(context).products.isEmpty) {
              return const Center(child: Text("No products available"));
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.714,
              ),
              itemBuilder: (context, index) {
                return ProductItem(
                  product: ProductsCubit.get(context).products[index],
                );
              },
              itemCount: ProductsCubit.get(context).products.length,
            );
          },
        ),
      ),
    );
  }
}
