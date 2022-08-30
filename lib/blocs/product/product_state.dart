part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {
  const ProductState();
  @override
  List<Object?> get props => [];
}

class ProductLoading extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoaded extends ProductState {
  final List<Product> products;
  @override
  List<Object?> get props => [products];

  const ProductLoaded({this.products = const <Product>[]});
}

class ProductError extends ProductState {
  @override
  List<Object?> get props => [];
}
