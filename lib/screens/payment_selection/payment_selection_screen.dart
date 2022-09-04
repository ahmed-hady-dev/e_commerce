import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';

import '../../blocs/bloc/payment_bloc.dart';
import '../../model/payment_method_model.dart';
import '../../widgets/custom_appbar.dart';

class PaymentSelectionScreen extends StatelessWidget {
  const PaymentSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(text: 'Payment Selection'),
      // bottomNavigationBar: CustomNavBar(),
      body: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if (state is PaymentLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          if (state is PaymentLoaded) {
            return ListView(
              padding: const EdgeInsets.all(20.0),
              children: [
                const SizedBox(height: 10),
                Platform.isAndroid
                    ? RawGooglePayButton(
                        style: GooglePayButtonStyle.black,
                        type: GooglePayButtonType.pay,
                        onPressed: () {
                          context.read<PaymentBloc>().add(
                                const SelectPaymentMethod(paymentMethod: PaymentMethod.google_pay),
                              );
                          Navigator.pop(context);
                        },
                      )
                    : const SizedBox(),
                ElevatedButton(
                  onPressed: () {
                    context.read<PaymentBloc>().add(
                          const SelectPaymentMethod(paymentMethod: PaymentMethod.credit_card),
                        );
                    Navigator.pop(context);
                  },
                  child: const Text('Pay with Credit Card'),
                ),
              ],
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
