import 'package:flutter/material.dart';

import '../../custom widgets/elevated_button.dart';
import '../../custom widgets/sized_box.dart';

class DiscountOfferTile extends StatefulWidget {
  const DiscountOfferTile({super.key});

  @override
  State<DiscountOfferTile> createState() => _DiscountOfferTileState();
}

class _DiscountOfferTileState extends State<DiscountOfferTile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: height > 460 ? height * 0.25 : height * 0.23,
      alignment: Alignment.centerRight,
      constraints: const BoxConstraints(
        maxHeight: 600,
        minHeight: 140,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.black,
        image: DecorationImage(
          opacity: 90,
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/images/background_pic4.jpg",
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            width > 1000 ? CrossAxisAlignment.center : CrossAxisAlignment.end,
        children: [
          const Text(
            "Up to 49% off",
            style: TextStyle(
                color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
          ),
          const MySizedBox(heightRatio: 0.005),
          const Text(
            "Aug 10 - Sept 10",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                overflow: TextOverflow.ellipsis),
          ),
          const MySizedBox(heightRatio: 0.055),
          Expanded(
            flex: 0,
            child: MyElevatedButton(
              screenHeight: 500,
              maxWidth: 250,
              minHeight: 33,
              buttonAlignment:
                  width > 1000 ? Alignment.center : Alignment.bottomRight,
              fontSize: height > 450 ? 17 : 15,
              buttonText: "Order Now",
              buttonPress: () {},
              buttonHeightRatio: 0.05,
              buttonWidthRatio: 0.38,
            ),
          )
        ],
      ),
    );
  }
}
