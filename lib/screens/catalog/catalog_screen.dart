import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/screens/home/product_card.dart';
import 'package:e_commerce/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../model/categry_model.dart';
import '../../widgets/custom_nav_bar.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key, required this.category}) : super(key: key);
  final Category category;
  @override
  Widget build(BuildContext context) {
    final List<Product> categoryList = Product.products.where((product) => product.category == category.name).toList();
    return Scaffold(
      appBar: CustomAppbar(text: category.name),
      bottomNavigationBar: const CustomNavBar(),
      body: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.15,
          ),
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return ProductCard(
              product: categoryList[index],
              widthFactor: 2.2,
            );
          }),
    );
  }
}
