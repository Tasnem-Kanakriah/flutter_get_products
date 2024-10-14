import 'package:bloc/bloc.dart';
import 'package:demo/services/product_service.dart';
import 'package:meta/meta.dart';

import '../../models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProductEvent>(
      (event, emit) async {
        final product = await getProduct();
        if (product.isEmpty) {
          emit(EmptyData());
        } else {
          emit(
            SuccessToGetData(listProduct: await getProduct()),
          );
        }
      },
    );
  }
}
