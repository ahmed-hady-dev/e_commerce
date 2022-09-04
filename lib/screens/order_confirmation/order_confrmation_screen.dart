import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/widgets/order_summery_product_card.dart';
import 'package:e_commerce/widgets/order_summery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_nav_bar.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(text: 'Order Confirmation'),
        bottomNavigationBar: const CustomNavBar(),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    color: Colors.black,
                    width: double.infinity,
                    height: 300.0,
                  ),
                  Positioned(
                    left: (MediaQuery.of(context).size.width - 100) / 2,
                    top: 125.0,
                    child: SvgPicture.asset('assets/svgs/garlands.svg'),
                  ),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    top: 250.0,
                    height: 100.0,
                    child: Text('Your order is complete!',
                        style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('ORDER CODE : #k321-ekd3', style: Theme.of(context).textTheme.headline5),
                    const SizedBox(height: 10),
                    Text('ORDER CODE : #k321-ekd3', style: Theme.of(context).textTheme.headline6),
                    const OrderSummery(),
                    const SizedBox(height: 10),
                    Text('ORDER DETAILS', style: Theme.of(context).textTheme.headline5),
                    Divider(thickness: 2),
                    const SizedBox(height: 5),
                    ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        OrderSummeryProductCard(
                          quantity: 2,
                          product: Product.products[0],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
