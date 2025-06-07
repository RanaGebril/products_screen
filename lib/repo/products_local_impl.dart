import 'package:products_screen/cash_products.dart';
import 'package:products_screen/models/Product.dart';
import 'package:products_screen/repo/repo.dart';

class ProductsLocalImpl extends ProductsRepo {
  @override
  Future<List<Product>> fetchProducts() async {
    final products = await CashProducts.getProducts();
    if (products == null || products.isEmpty) {
      return [];
    }
    return products;
  }
}
