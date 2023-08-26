import 'package:flutter/material.dart';

import '../../utilities/consts.dart';

class MyAppNameText extends StatelessWidget {
  final double? fontSize;
  final TextStyle? textStyle;
  final num? widthRatio;
  final num? heightRatio;
  final TextOverflow? overFlow;
  final FontStyle? fontStyle;
  final Color? color;
  const MyAppNameText({
    super.key,
    this.fontSize,
    this.textStyle,
    this.overFlow,
    this.widthRatio,
    this.heightRatio,
    this.fontStyle,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      appName,
      textAlign: TextAlign.center,
      overflow: overFlow,
      style: textStyle ??
          TextStyle(
              fontStyle: fontStyle ?? FontStyle.italic,
              fontSize: fontSize ?? 25,
              color: color ?? Colors.white),
    );
  }
}
