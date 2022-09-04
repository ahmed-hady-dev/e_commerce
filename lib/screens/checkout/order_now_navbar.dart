import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/checkout/checkout_bloc.dart';
import '../../core/router/router.dart';
import '../../model/payment_method_model.dart';
import '../../widgets/google_pay.dart';
import '../payment_selection/payment_selection_screen.dart';

class OrderNowNavBar extends StatelessWidget {
  const OrderNowNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            if (state is CheckoutLoaded) {
              if (state.paymentMethod == PaymentMethod.credit_card) {
                return Container(
                  child: Text(
                    'Pay with Credit Card',
                    style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
                  ),
                );
              }
              if (Platform.isAndroid && state.paymentMethod == PaymentMethod.google_pay) {
                return GooglePay(
                  products: state.products!,
                  total: state.total!,
                );
              } else {
                return ElevatedButton(
                  onPressed: () {
                    MagicRouter.navigateTo(PaymentSelectionScreen());
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Text(
                    'CHOOSE PAYMENT',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                );
              }
            } else {
              return Text('Something went wrong');
            }
          },
        ),
      ],
    );
  }
}
