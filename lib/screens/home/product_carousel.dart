import 'package:e_commerce/screens/home/product_card.dart';
import 'package:flutter/material.dart';

import '../../model/product_model.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({
    Key? key,
    required this.products,
  }) : super(key: key);
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 165,
        child: ListView.builder(
          itemCount: products.length,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: ProductCard(product: products[index]),
            );
          },
        ),
      ),
    );
  }
}
