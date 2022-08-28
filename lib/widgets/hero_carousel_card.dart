import 'package:e_commerce/core/router/router.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/screens/catalog/catalog_screen.dart';
import 'package:flutter/material.dart';

import '../model/category_model.dart';

class HeroCarouselCard extends StatelessWidget {
  final Category? category;
  final Product? product;
  const HeroCarouselCard({Key? key, this.category, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (product == null) {
          MagicRouter.navigateTo(CatalogScreen(category: category!));
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(
                  product == null ? category!.imageUrl : product!.imageUrl,
                  fit: BoxFit.cover,
                  width: 1000.0,
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      product == null ? category!.name : '',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: Colors.white,
                            fontSize: 22.0,
                          ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
