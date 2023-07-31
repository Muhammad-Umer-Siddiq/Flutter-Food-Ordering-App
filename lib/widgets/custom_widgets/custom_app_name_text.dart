import 'package:flutter/material.dart';

class MyAppNameText extends StatelessWidget {
  final double? textSize;
  final TextStyle? textStyle;
  const MyAppNameText({super.key, this.textSize, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Order @ Eat",
      style: textStyle ??
          TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: textSize ?? 36,
              color: Colors.white),
    );
  }
}
