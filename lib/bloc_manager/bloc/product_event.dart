part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class GetProductEvent extends ProductEvent {}

// ?  Search for a specific product

class ProductOnSearchEvent extends ProductEvent {
  final String word;
  ProductOnSearchEvent({required this.word});
}
