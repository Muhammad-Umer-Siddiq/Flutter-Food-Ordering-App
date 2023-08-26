import 'package:flutter/material.dart';

import '../utilities/helpers.dart';
import '../widgets/components/main food/header_text.dart';
import '../widgets/custom widgets/elevated_button.dart';
import '../widgets/custom widgets/sized_box.dart';
import '../widgets/custom widgets/text_form_field.dart';
import 'order_placed_screen.dart';

// Fully responsive
// Tested on min size of 320 × 320
// Tested on full web size (1536 × 747)

class PaymentEnterDetailsScreen extends StatefulWidget {
  const PaymentEnterDetailsScreen({super.key});

  @override
  State<PaymentEnterDetailsScreen> createState() =>
      _PaymentEnterDetailsScreenState();
}

class _PaymentEnterDetailsScreenState extends State<PaymentEnterDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeaderText(
              'Payment Details',
              fontSize: 30,
              textAlign: TextAlign.left,
            ),
            const MySizedBox(heightRatio: 0.15),
            const MyTextFormField(
              labelText: 'Card Details',
              textColor: Colors.black,
              fieldWidth: 0.85,
              floatingLabelStyle: TextStyle(color: Colors.black),
              labelStyle: TextStyle(color: Colors.black),
              simpleBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
            ),
            const MySizedBox(heightRatio: 0.05),
            const MyTextFormField(
              textColor: Colors.black,
              fieldWidth: 0.85,
              labelText: 'CVV',
              floatingLabelStyle: TextStyle(color: Colors.black),
              labelStyle: TextStyle(color: Colors.black),
              simpleBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
            ),
            const MySizedBox(heightRatio: 0.08),
            MyElevatedButton(
              buttonText: 'Pay Now',
              buttonPress: () {
                setState(() {
                  DeliveryProcessHelpers().setEverythingDefault();
                });
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderPlacedScreen(),
                    ));
                // Once user order completed
              },
            )
          ],
        ),
      ),
    );
  }
}
