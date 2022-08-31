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
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: [
    //     Container(
    //       child: Text(
    //         'Pay with Credit Card',
    //         style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
    //       ),
    //     )
    //     // BlocBuilder<CheckoutBloc, CheckoutState>(
    //     //   builder: (context, state) {
    //     //     if (state is CheckoutLoading) {
    //     //       return Center(child: CircularProgressIndicator(color: Colors.white));
    //     //     }
    //     //     if (state is CheckoutLoaded) {
    //     //       if (state.paymentMethod == PaymentMethod.credit_card) {
    //     //         return Container(
    //     //           child: Text(
    //     //             'Pay with Credit Card',
    //     //             style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
    //     //           ),
    //     //         );
    //     //       }
    //     //       if (Platform.isAndroid && state.paymentMethod == PaymentMethod.google_pay) {
    //     //         return GooglePay(
    //     //           products: state.products!,
    //     //           total: state.total!,
    //     //         );
    //     //       }
    //     //       if (Platform.isIOS && state.paymentMethod == PaymentMethod.apple_pay) {
    //     //         return ApplePay(
    //     //           products: state.products!,
    //     //           total: state.total!,
    //     //         );
    //     //       } else {
    //     //         return ElevatedButton(
    //     //           onPressed: () {
    //     //             Navigator.pushNamed(context, '/payment-selection');
    //     //           },
    //     //           style: ElevatedButton.styleFrom(primary: Colors.white),
    //     //           child: Text(
    //     //             'CHOOSE PAYMENT',
    //     //             style: Theme.of(context).textTheme.headline3,
    //     //           ),
    //     //         );
    //     //       }
    //     //     } else {
    //     //       return Text('Something went wrong');
    //     //     }
    //     //   },
    //     // ),
    //   ],
    // );
  }
}
