import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:products_screen/cash_products.dart';
import 'package:products_screen/models/Product.dart';
import 'package:products_screen/repo/repo.dart';

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
