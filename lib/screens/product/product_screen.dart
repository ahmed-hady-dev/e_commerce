import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/router/router.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/screens/cart/cart_screen.dart';
import 'package:e_commerce/widgets/hero_carousel_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/cart/cart_bloc.dart';
import '../../blocs/wishlist/wishlist_bloc.dart';
import '../../widgets/custom_appbar.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(text: product.name),
      bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: SizedBox(
              height: 70.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                      )),
                  BlocBuilder<WishlistBloc, WishlistState>(
                    builder: (context, state) {
                      return IconButton(
                          onPressed: () {
                            context.read<WishlistBloc>().add(AddWishlistProduct(product));
                            final snackBar =
                                SnackBar(content: Text('added to your Wishlist!', style: const TextStyle()));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ));
                    },
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.white),
                          onPressed: () {
                            context.read<CartBloc>().add(CartProductAdded(product));
                            MagicRouter.navigateTo(CartScreen());
                          },
                          child: Text('ADD TO CART', style: Theme.of(context).textTheme.headline3));
                    },
                  )
                ],
              ))),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                aspectRatio: 1.5,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                enlargeStrategy: CenterPageEnlargeStrategy.height),
            items: [
              HeroCarouselCard(
                product: product,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                    height: 50,
                    color: Colors.black,
                    margin: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width - 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(product.name,
                              style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white)),
                          Text('\$${product.price}',
                              style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white)),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text('Product Information', style: Theme.of(context).textTheme.headline3),
              children: [
                ListTile(
                  title: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: Theme.of(context).textTheme.bodyText2),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text('Delivery Information', style: Theme.of(context).textTheme.headline3),
              children: [
                ListTile(
                  title: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: Theme.of(context).textTheme.bodyText2),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
