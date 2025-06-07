import 'package:products_screen/models/Product.dart';

abstract class ProductsRepo {
  Future<List<Product>> fetchProducts();
}
