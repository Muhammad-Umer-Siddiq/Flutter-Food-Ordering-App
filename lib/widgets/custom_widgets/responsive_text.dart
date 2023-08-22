import 'package:flutter/material.dart';

class MyResponsiveText extends StatelessWidget {
  final String data;
  final double scaleFactor; // Adjust it accordingly
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLines;
  const MyResponsiveText(
    this.data, {
    super.key,
    this.scaleFactor = 0.025,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.overflow,
    this.textAlign,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenSize = screenWidth + screenHeight; // storing total screen size
    double responsiveFontSize = screenSize * scaleFactor;
    // To ensures that the font size will be a percentage of the screen size,
    // making text responsive to different screen sizes.

    return Text(
      data,
      textScaleFactor: 1,
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines ?? 1,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: responsiveFontSize,
        fontWeight: fontWeight,
        overflow: overflow,
      ),
    );
  }
}
