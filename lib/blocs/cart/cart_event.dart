part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCart extends CartEvent {
  @override
  List<Object?> get props => [];
}

class AddProduct extends CartEvent {
  final Product product;
  AddProduct(this.product);
  @override
  List<Object?> get props => [product];
}

class RemoveProduct extends CartEvent {
  final Product product;
  RemoveProduct(this.product);
  @override
  List<Object?> get props => [product];
}
