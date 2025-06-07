import 'package:hive/hive.dart';

import '../../data/models/Product.dart';


class CashProducts {
  static Box get box => Hive.box('productsBox');

  static Future<void> saveProducts(List<Product> products) async {
    List<Map<String, dynamic>> jsonList =
        products.map((p) => p.toJson()).toList();
    await box.put('products', jsonList);
  }

  static List<Product>? getProducts() {
    final List<dynamic>? jsonList = box.get('products');
    if (jsonList == null) return null;

    List<Product> products =
        jsonList
            .map((json) => Product.fromJson(Map<String, dynamic>.from(json)))
            .toList();
    return products;
  }
}
