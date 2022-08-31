import 'package:e_commerce/screens/checkout/order_now_navbar.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_nav_bar.dart';
import '../../widgets/order_summery.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController countryController = TextEditingController();
    TextEditingController zipCodeController = TextEditingController();

    return Scaffold(
      appBar: CustomAppbar(text: 'Checkout'),
      bottomNavigationBar: const OrderNowNavBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('CUSTOMER INFORMATION', style: Theme.of(context).textTheme.headline3),
            _buildTextFormField(emailController, context, 'Email'),
            _buildTextFormField(nameController, context, 'Full Name'),
            Text('DELIVERY INFORMATION', style: Theme.of(context).textTheme.headline3),
            _buildTextFormField(addressController, context, 'Address'),
            _buildTextFormField(cityController, context, 'City'),
            _buildTextFormField(countryController, context, 'Country'),
            _buildTextFormField(zipCodeController, context, 'Zip Code'),
            Text('ORDER SUMMERY', style: Theme.of(context).textTheme.headline3),
            const OrderSummery(),
          ],
        ),
      ),
    );
  }

  Padding _buildTextFormField(TextEditingController controller, BuildContext context, String labelText) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 75,
            child: Text(labelText, style: Theme.of(context).textTheme.bodyText1),
          ),
          Expanded(
              child: TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(left: 10.0),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
