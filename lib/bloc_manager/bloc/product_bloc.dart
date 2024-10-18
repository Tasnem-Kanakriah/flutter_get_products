import 'package:bloc/bloc.dart';
import 'package:demo/services/product_service.dart';
import 'package:meta/meta.dart';

import '../../models/product_model.dart';
part 'product_event.dart';
part 'product_state.dart';

List<ProductModel> products = [];
List<ProductModel> listProductsHasFoundOnSearch = [];

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProductEvent>(
      (event, emit) async {
        emit(Loading());
        products = await getProduct();
        if (products.isEmpty) {
          emit(EmptyData());
        } else {
          emit(
            SuccessToGetData(listProduct: products),
          );
        }
      },
    );

    // ?  Search for a specific product

    on<ProductOnSearchEvent>(
      (event, emit) async {
        emit(Loading());
        await Future.delayed(const Duration(seconds: 1));
        if (products.isEmpty) {
          emit(EmptyData());
        } else {
          // print('object');
          for (var product in products) {
            if (product.category!.startsWith(event.word)) {
              listProductsHasFoundOnSearch.add(product);
            }
          }
          // print(listProductsHasFoundOnSearch.length);
          listProductsHasFoundOnSearch.isEmpty
              ? emit(DoesNotHasAnyProductByThisName())
              : emit(ProductHasSearch(
                  productHasFound: listProductsHasFoundOnSearch));

          listProductsHasFoundOnSearch = [];
        }
      },
    );
  }
}
