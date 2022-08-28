import 'package:equatable/equatable.dart';

import 'product_model.dart';

class Wishlist extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [products];

  final List<Product> products;

  const Wishlist({
    this.products = const <Product>[],
  });
}
