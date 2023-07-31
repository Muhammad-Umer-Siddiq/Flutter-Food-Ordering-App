import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final VoidCallback buttonPress;
  final String childText;
  final Color? buttonColor;
  final num? buttonWidthRatio;
  final double? buttonHeight;
  final double? textSize;
  final Color? textCoLor;

  const MyElevatedButton({
    super.key,
    required this.childText,
    required this.buttonPress,
    this.buttonColor,
    this.buttonHeight,
    this.buttonWidthRatio,
    this.textSize,
    this.textCoLor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 20,
            backgroundColor: buttonColor ?? Colors.red,
            fixedSize: Size(
                MediaQuery.of(context).size.width * (buttonWidthRatio ?? 0.7),
                buttonHeight ?? 50)),
        onPressed: buttonPress,
        child: Text(
          childText,
          style: TextStyle(
              color: textCoLor ?? Colors.white, fontSize: textSize ?? 20),
        ));
  }
}
