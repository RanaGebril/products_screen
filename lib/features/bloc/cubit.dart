import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_screen/data/models/Product.dart';
import 'package:products_screen/data/repositories/repo.dart';
import 'package:products_screen/features/bloc/cubit_states.dart';

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
