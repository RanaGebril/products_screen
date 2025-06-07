import 'package:products_screen/data/models/Product.dart';

abstract class ProductsRepo {
  Future<List<Product>> fetchProducts();
}
