import 'package:e_commerce/core/router/router.dart';
import 'package:e_commerce/screens/checkout/order_now_navbar.dart';
import 'package:e_commerce/screens/payment_selection/payment_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/checkout/checkout_bloc.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/order_summery.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(text: 'Checkout'),
      bottomNavigationBar: const OrderNowNavBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CheckoutLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CUSTOMER INFORMATION',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  CustomTextFormField(
                    title: 'Email',
                    onChanged: (value) {
                      context.read<CheckoutBloc>().add(UpdateCheckout(email: value));
                    },
                  ),
                  CustomTextFormField(
                    title: 'Full Name',
                    onChanged: (value) {
                      context.read<CheckoutBloc>().add(UpdateCheckout(fullName: value));
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'DELIVERY INFORMATION',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  CustomTextFormField(
                    title: 'Address',
                    onChanged: (value) {
                      context.read<CheckoutBloc>().add(UpdateCheckout(address: value));
                    },
                  ),
                  CustomTextFormField(
                    title: 'City',
                    onChanged: (value) {
                      context.read<CheckoutBloc>().add(UpdateCheckout(city: value));
                    },
                  ),
                  CustomTextFormField(
                    title: 'Country',
                    onChanged: (value) {
                      context.read<CheckoutBloc>().add(UpdateCheckout(country: value));
                    },
                  ),
                  CustomTextFormField(
                    title: 'ZIP Code',
                    onChanged: (value) {
                      context.read<CheckoutBloc>().add(UpdateCheckout(zipCode: value));
                    },
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 60,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(color: Colors.black),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: TextButton(
                            onPressed: () {
                              MagicRouter.navigateTo(PaymentSelectionScreen());
                            },
                            child: Text(
                              'SELECT A PAYMENT METHOD',
                              style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'ORDER SUMMARY',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const OrderSummery(),
                ],
              );
            } else {
              return Text('Something went wrong');
            }
          },
        ),
      ),
    );
  }
}
// class CheckoutScreen extends StatelessWidget {
//   const CheckoutScreen({Key? key}) : super(key: key);
//
//   Padding _buildTextFormField(
//     Function(String)? onChanged,
//     BuildContext context,
//     String labelText,
//   ) {
//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: Row(
//         children: <Widget>[
//           SizedBox(
//             width: 75,
//             child: Text(labelText, style: Theme.of(context).textTheme.bodyText1),
//           ),
//           Expanded(
//               child: TextFormField(
//             onChanged: onChanged,
//             decoration: const InputDecoration(
//               isDense: true,
//               contentPadding: EdgeInsets.only(left: 10.0),
//               focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.black),
//               ),
//             ),
//           ))
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppbar(text: 'Checkout'),
//       bottomNavigationBar: const OrderNowNavBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: BlocBuilder<CheckoutBloc, CheckoutState>(
//           builder: (context, state) {
//             if (state is CheckoutLoading) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             if (state is CheckoutLoaded) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text('CUSTOMER INFORMATION', style: Theme.of(context).textTheme.headline3),
//                   _buildTextFormField((value) {
//                     context.read<CheckoutBloc>().add(UpdateCheckout(email: value));
//                   }, context, 'Email'),
//                   _buildTextFormField((value) {
//                     context.read<CheckoutBloc>().add(UpdateCheckout(fullName: value));
//                   }, context, 'Full Name'),
//                   Text('DELIVERY INFORMATION', style: Theme.of(context).textTheme.headline3),
//                   _buildTextFormField((value) {
//                     context.read<CheckoutBloc>().add(UpdateCheckout(address: value));
//                   }, context, 'Address'),
//                   _buildTextFormField((value) {
//                     context.read<CheckoutBloc>().add(UpdateCheckout(city: value));
//                   }, context, 'City'),
//                   _buildTextFormField((value) {
//                     context.read<CheckoutBloc>().add(UpdateCheckout(country: value));
//                   }, context, 'Country'),
//                   _buildTextFormField((value) {
//                     context.read<CheckoutBloc>().add(UpdateCheckout(zipCode: value));
//                   }, context, 'Zip Code'),
//                   SizedBox(height: 20),
//                   Container(
//                     height: 60,
//                     alignment: Alignment.bottomCenter,
//                     decoration: BoxDecoration(color: Colors.black),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Center(
//                           child: TextButton(
//                             onPressed: () {
//                               MagicRouter.navigateTo(PaymentSelectionScreen());
//                             },
//                             child: Text(
//                               'SELECT A PAYMENT METHOD',
//                               style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () {},
//                           icon: Icon(
//                             Icons.arrow_forward,
//                             color: Colors.white,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text('ORDER SUMMERY', style: Theme.of(context).textTheme.headline3),
//                   const OrderSummery(),
//                 ],
//               );
//             } else {
//               return const Text('Something went wrong', style: TextStyle());
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
