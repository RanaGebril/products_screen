import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_screen/bloc/cubit_states.dart';
import 'package:products_screen/models/Product.dart';
import 'package:products_screen/repo/repo.dart';

class ProductsCubit extends Cubit<ProductsScreenStates> {
  ProductsRepo repo;
  ProductsCubit(this.repo) : super(ProductsInit());
  static ProductsCubit get(context) => BlocProvider.of(context);

  List<Product> products = [];
  Future<void> getProducts() async {
    try {
      emit(GetProductsLoadingState());
      products = await repo.fetchProducts();
      emit(GetProductsSuccessState());
    } catch (e) {
      print("Error fetching products: ${e.toString()}");
      emit(GetProductsErrorState());
    }
  }
}
