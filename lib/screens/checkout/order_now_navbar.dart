import 'package:e_commerce/core/router/router.dart';
import 'package:e_commerce/screens/order_confirmation/order_confrmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/checkout/checkout_bloc.dart';

class OrderNowNavBar extends StatelessWidget {
  const OrderNowNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
                  if (state is CheckoutLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is CheckoutLoaded) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<CheckoutBloc>().add(ConfirmCheckout(checkout: state.checkout));
                        MagicRouter.navigateTo(const OrderConfirmationScreen());
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.white, shape: const RoundedRectangleBorder()),
                      child: Text('ORDER NOW', style: Theme.of(context).textTheme.headline3),
                    );
                  } else {
                    return const Text('Something went wrong', style: TextStyle());
                  }
                },
              ),
            ],
          )),
    );
  }
}
