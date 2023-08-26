import 'package:flutter/material.dart';

import '../../custom widgets/sized_box.dart';

class FoodDisplayTile extends StatelessWidget {
  final String? foodName;
  final Widget? bottomWidget;
  final Widget? foodImage;
  const FoodDisplayTile(
      {super.key,
      required this.foodName,
      this.bottomWidget,
      required this.foodImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MySizedBox(heightRatio: 0.02),
        Expanded(
          flex: 0,
          child: SizedBox(height: 90, width: 105, child: foodImage),
        ),
        Text(
          foodName!,
          textScaleFactor: 1,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18.5,
          ),
        ),
        bottomWidget!
      ],
    );
  }
}
