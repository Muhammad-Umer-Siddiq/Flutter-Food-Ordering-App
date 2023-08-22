import 'package:flutter/material.dart';

import '../widgets/custom_widgets/custom_elevated_button.dart';
import 'order_placed_screen.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyElevatedButton(
              buttonText: 'Pay Now',
              buttonPress: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderPlacedScreen(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
