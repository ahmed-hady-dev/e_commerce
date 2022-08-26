import 'package:e_commerce/core/router/router.dart';
import 'package:e_commerce/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final String text;
  const CustomAppbar({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white, fontSize: 22.0),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        IconButton(onPressed: () => MagicRouter.navigateTo(const WishlistScreen()), icon: const Icon(Icons.favorite))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
