part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {
  const CartState();
  @override
  List<Object?> get props => [];
}

class CartLoading extends CartState {
  @override
  List<Object?> get props => [];
}

class CartLoaded extends CartState {
  final Cart cart;
  @override
  List<Object?> get props => [cart];

  const CartLoaded({this.cart = const Cart()});
}

class CartError extends CartState {
  @override
  List<Object?> get props => [];
}
