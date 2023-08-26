import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String data;
  final double? fontSize;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overFlow;
  const HeaderText(
    this.data, {
    super.key,
    this.fontSize,
    this.color,
    this.textAlign,
    this.overFlow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textScaleFactor: 1,
      overflow: overFlow ?? TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
          color: color ?? Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: fontSize ?? 19),
    );
  }
}
