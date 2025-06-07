import 'package:products_screen/core/utils/cash_products.dart';
import 'package:products_screen/data/models/Product.dart';
import 'package:products_screen/data/repositories/repo.dart';

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
