import 'package:e_commerce/model/product_model.dart';
import 'package:flutter/material.dart';

class OrderSummeryProductCard extends StatelessWidget {
  const OrderSummeryProductCard({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);
  final Product product;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: <Widget>[
          Image.network(product.imageUrl, fit: BoxFit.cover, width: 100.0, height: 80.0),
          const SizedBox(width: 10.0),
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Text(product.name, style: Theme.of(context).textTheme.headline5),
                Text('Qty. $quantity', style: Theme.of(context).textTheme.headline6),
              ],
            ),
          ),
          Expanded(
            child: Text('\$${product.price}', style: Theme.of(context).textTheme.headline5),
          ),
        ],
      ),
    );
  }
}
