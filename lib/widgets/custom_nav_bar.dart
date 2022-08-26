import 'package:e_commerce/core/router/router.dart';
import 'package:e_commerce/screens/user/user_screen.dart';
import 'package:flutter/material.dart';

import '../screens/cart/cart_screen.dart';
import '../screens/home/home_screen.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
                onPressed: () => MagicRouter.navigateTo(const HomeScreen()),
                icon: const Icon(Icons.home, color: Colors.white)),
            IconButton(
                onPressed: () => MagicRouter.navigateTo(const CartScreen()),
                icon: const Icon(Icons.shopping_cart, color: Colors.white)),
            IconButton(
                onPressed: () => MagicRouter.navigateTo(const UserScreen()),
                icon: const Icon(Icons.person, color: Colors.white)),
          ],
        ));
  }
}
