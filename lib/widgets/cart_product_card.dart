import 'package:e_commerce/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/product_model.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard({Key? key, required this.product, required this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: <Widget>[
          Image.network(product.imageUrl, width: 100.0, height: 80.0, fit: BoxFit.cover),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(product.name, style: Theme.of(context).textTheme.headline5),
                Text('\$${product.price}', style: Theme.of(context).textTheme.headline6),
              ],
            ),
          ),
          const SizedBox(width: 10),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(RemoveProduct(product));
                      },
                      icon: const Icon(Icons.remove_circle)),
                  Text(quantity.toString(), style: Theme.of(context).textTheme.headline4),
                  IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(AddProduct(product));
                      },
                      icon: const Icon(Icons.add_circle)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
