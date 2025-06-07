import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:products_screen/bloc/cubit_states.dart';
import 'package:products_screen/models/Product.dart';

class ProductsCubit extends Cubit<ProductsScreenStates> {
  ProductsCubit() : super(ProductsInit());

  static ProductsCubit get(context) => BlocProvider.of(context);

  List<Product> products = [];

  Future<void> getProducts() async {
    try {
      emit(GetProductsLoadingState());

      Uri url = Uri.https("fakestoreapi.com", "products");
      http.Response response = await http.get(url);

      List<dynamic> jsonData = jsonDecode(response.body);
      products = jsonData.map((json) => Product.fromJson(json)).toList();

      emit(GetProductsSuccessState());
    } catch (e) {
      emit(GetProductsErrorState());
    }
  }
}
