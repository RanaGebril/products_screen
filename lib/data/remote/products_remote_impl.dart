import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:products_screen/core/utils/cash_products.dart';
import 'package:products_screen/data/models/Product.dart';
import 'package:products_screen/data/repositories/repo.dart';

class ProductsRemoteImpl extends ProductsRepo {
  @override
  Future<List<Product>> fetchProducts() async {
    Uri url = Uri.https("fakestoreapi.com", "products");
    http.Response response = await http.get(url);
    List<dynamic> jsonData = jsonDecode(response.body);
    List<Product> products =
        jsonData.map((json) => Product.fromJson(json)).toList();

    // cash data
    CashProducts.saveProducts(products);
    return products;
  }
}
