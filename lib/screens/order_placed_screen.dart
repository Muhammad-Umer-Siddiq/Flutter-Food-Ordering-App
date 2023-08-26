import 'package:flutter/material.dart';

import '../utilities/values.dart';
import '../widgets/components/main food/header_text.dart';
import '../widgets/custom widgets/elevated_button.dart';
import '../widgets/custom widgets/sized_box.dart';
import 'main_food_screen.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MySizedBox(
          heightRatio: 1,
          widthRatio: 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_rounded,
                size: 100,
                color: Colors.redAccent,
              ),
              const MySizedBox(heightRatio: 0.02),
              const HeaderText(
                'Your order has been\nplaced successfully',
                fontSize: 32,
              ),
              const MySizedBox(heightRatio: 0.02),
              Text(
                "Sit & relax while your order is being\n worked on. It'll take ${timeInOrderToArrive}min before you\nget it",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              const MySizedBox(heightRatio: 0.05),
              MyElevatedButton(
                buttonAlignment: Alignment.bottomCenter,
                buttonText: 'Go back to home',
                buttonPress: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainFoodScreen(),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
