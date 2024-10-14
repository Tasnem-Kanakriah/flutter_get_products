// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class Loading extends ProductState {}

class EmptyData extends ProductState {}

class SuccessToGetData extends ProductState {
  List<ProductModel> listProduct ;
  SuccessToGetData({
    required this.listProduct,
  });
}
