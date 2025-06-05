import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:products_screen/models/Product.dart';

class ApiManager{
  static Future<List<Product>>  getProducts() async {
    Uri url=Uri.https("fakestoreapi.com","products");
    http.Response response=await http.get(url);
    List<dynamic> jsonData=jsonDecode(response.body);
    return jsonData.map((json) => Product.fromJson(json)).toList();

  }
}