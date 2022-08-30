part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProduct extends ProductEvent {}

class UpdateProduct extends ProductEvent {
  final List<Product> products;
  UpdateProduct(this.products);

  @override
  List<Object?> get props => [products];
}
