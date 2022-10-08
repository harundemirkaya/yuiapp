import 'package:bloc/bloc.dart';
import 'package:yuiapp/bloc/services/getData.dart';

import '../models/category_model.dart';
import '../models/product_model.dart';

abstract class ProductState {
  const ProductState();
}

class ProductInitial extends ProductState {
  const ProductInitial();
}

class ProductLoading extends ProductState {
  const ProductLoading();
}

class ProductsGet extends ProductState {
  final List<ProductModel> response;
  const ProductsGet(this.response);
}

class CategoriesGet extends ProductState {
  final List<CategoryModel> response;
  const CategoriesGet(this.response);
}

class ProductError extends ProductState {
  final String message;
  const ProductError(this.message);
}

class ProductGet extends ProductState {
  final String id;
  const ProductGet(this.id);
}

class ProductCubit extends Cubit<ProductState> {
  final YuiRepo _yuiRepo;
  ProductCubit(this._yuiRepo) : super(const ProductInitial());
  Future<List<ProductModel>> getProducts() async {
    final response = await _yuiRepo.getProducts();
    emit(ProductsGet(response));
    return response;
  }

  Future<List<CategoryModel>> getCategories() async {
    final response = await _yuiRepo.getCategories();
    emit(CategoriesGet(response));
    return response;
  }
}
