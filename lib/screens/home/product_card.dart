import 'package:e_commerce/core/router/router.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/screens/product/product_screen.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;

  const ProductCard({
    Key? key,
    required this.product,
    this.widthFactor = 2.5,
    this.leftPosition = 5,
    this.isWishlist = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () => MagicRouter.navigateTo(ProductScreen(product: product)),
      child: Stack(
        children: [
          Container(
            width: widthValue,
            height: 150.0,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition,
            child: Container(
              width: widthValue - 5 - leftPosition,
              height: 80.0,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
            ),
          ),
          Positioned(
            top: 65,
            left: leftPosition + 5,
            child: Container(
                width: widthValue - 15 - leftPosition,
                height: 70.0,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(color: Colors.black),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              product.name,
                              style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),
                            ),
                            Text(
                              "\$${product.price.toString()}",
                              style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      isWishlist
                          ? Expanded(
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
