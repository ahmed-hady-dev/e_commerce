import 'package:e_commerce/blocs/cart/cart_bloc.dart';
import 'package:e_commerce/core/router/router.dart';
import 'package:e_commerce/widgets/order_summery.dart';
import 'package:e_commerce/screens/checkout/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                        onPressed: () => MagicRouter.navigateTo(const CheckoutScreen()),
                        child: Text('GO TO CHECKOUT', style: Theme.of(context).textTheme.headline3))
                  ],
                ))),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CartLoaded) {
              return Padding(
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
                        state.cart.products.isEmpty
                            ? Center(
                                child: Text('there is no items in cart', style: Theme.of(context).textTheme.headline5))
                            : SizedBox(
                                height: 400.0,
                                child: ListView.builder(
                                  itemCount: state.cart.productQuantity(state.cart.products).keys.length,
                                  itemBuilder: (context, index) {
                                    return CartProductCard(
                                      product: state.cart.productQuantity(state.cart.products).keys.elementAt(index),
                                      quantity: state.cart.productQuantity(state.cart.products).values.elementAt(index),
                                    );
                                  },
                                )),
                      ],
                    ),
                    const OrderSummery(),
                  ],
                ),
              );
            } else {
              return const Text('Something went wrong', style: TextStyle());
            }
          },
        ));
  }
}
