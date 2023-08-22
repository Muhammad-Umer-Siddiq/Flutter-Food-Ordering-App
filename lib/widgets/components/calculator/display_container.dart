import 'package:flutter/material.dart';

import '../../../utilities/colors.dart';

class DisplayContainer extends StatelessWidget {
  final Alignment? childAlignment;
  final Widget? childWidget;
  final String? insideText;
  final Color? textColor;
  final double? textSize;
  final double? topPadding;
  final double? bottomPadding;
  final double? rightPadding;
  final double? leftPadding;

  const DisplayContainer({
    super.key,
    this.childAlignment,
    this.childWidget,
    this.insideText,
    this.textColor,
    this.textSize,
    this.topPadding,
    this.bottomPadding,
    this.leftPadding,
    this.rightPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: topPadding ?? 16,
          bottom: bottomPadding ?? 1,
          right: rightPadding ?? 16,
          left: leftPadding ?? 16),
      alignment: childAlignment ?? Alignment.centerLeft,
      child: childWidget ??
          Text(
            insideText!,
            style: TextStyle(
                color: textColor ?? CalculatorColors().displayTextColor,
                fontSize: textSize ?? 35),
          ),
    );
  }
}
