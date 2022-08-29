import 'package:e_commerce/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../widgets/cart_product_card.dart';
import '../../widgets/custom_appbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(text: 'Cart'),
        bottomNavigationBar: BottomAppBar(
            color: Colors.black,
            child: SizedBox(
                height: 70.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: () {},
                        child: Text('GO TO CHECKOUT', style: Theme.of(context).textTheme.headline3))
                  ],
                ))),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Add \$20.0 for FREE Delivery', style: Theme.of(context).textTheme.headline5),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black, shape: const RoundedRectangleBorder(), elevation: 0.0),
                        child: Text('Add More Items',
                            style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  CartProductCard(product: Product.products[0]),
                  CartProductCard(product: Product.products[0]),
                ],
              ),
              Column(
                children: <Widget>[
                  const Divider(thickness: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('SUBTOTAL', style: Theme.of(context).textTheme.headline5),
                            Text('\$5.98', style: Theme.of(context).textTheme.headline5),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('DELIVERY FEE', style: Theme.of(context).textTheme.headline5),
                            Text('\$2.90', style: Theme.of(context).textTheme.headline5),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60.0,
                        decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50.0,
                          margin: const EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(color: Colors.black),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('TOTAL',
                                    style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white)),
                                Text('\$12.90',
                                    style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
