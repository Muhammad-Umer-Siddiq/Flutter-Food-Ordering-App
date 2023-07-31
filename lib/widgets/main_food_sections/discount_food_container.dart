import 'package:flutter/material.dart';

import '../custom_widgets/custom_elevated_button.dart';
import '../custom_widgets/custom_sized_box_media_query.dart';

class DiscountFoodContainer extends StatefulWidget {
  const DiscountFoodContainer({super.key});

  @override
  State<DiscountFoodContainer> createState() => _DiscountFoodContainerState();
}

class _DiscountFoodContainerState extends State<DiscountFoodContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.98,
      height: MediaQuery.of(context).size.height * 0.22,
      padding: const EdgeInsets.only(left: 158.0, top: 8, right: 6),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.black,
        image: DecorationImage(
          opacity: 70,
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/images/background_pic4.jpg",
          ),
        ),
      ),
      child: Column(
        children: [
          const Text(
            "Up to 49% off",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const MySizedBox(heightRatio: 0.005),
          const Text(
            "July 16 - August 16",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const MySizedBox(heightRatio: 0.055),
          MyElevatedButton(
            textSize: 19,
            childText: "Order Now",
            buttonPress: () {},
            buttonHeight: 36,
            buttonWidthRatio: 0.40,
          )
        ],
      ),
    );
  }
}
