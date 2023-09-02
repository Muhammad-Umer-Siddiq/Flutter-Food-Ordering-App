import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color? containerColor;
  final double? elevation;
  final Widget contentWidget;
  final VoidCallback? cardTap;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final double? borderCurve;
  final Color? cardColor;
  final Color? surfaceTintColor;
  final Color? shadowColor;
  final VoidCallback? cardLongPress;
  final AlignmentGeometry? contentAlignment;
  final EdgeInsetsGeometry? contentPadding;
  final ShapeBorder? shape;
  const CustomCard({
    super.key,
    this.containerColor,
    this.elevation,
    this.cardTap,
    this.width,
    this.height,
    this.borderRadius,
    this.borderCurve,
    required this.contentWidget,
    this.cardColor,
    this.surfaceTintColor,
    this.shadowColor,
    this.cardLongPress,
    this.contentAlignment,
    this.contentPadding,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: cardLongPress,
      onTap: cardTap,
      child: Card(
        surfaceTintColor: surfaceTintColor ?? Colors.white,
        shadowColor: shadowColor ?? Colors.black,
        color: cardColor ?? Colors.white,
        shape: shape ??
            OutlineInputBorder(
                borderRadius:
                    borderRadius ?? BorderRadius.circular(borderCurve ?? 18),
                borderSide: const BorderSide(color: Colors.white)),
        elevation: elevation ?? 1,
        child: Container(
          width: width,
          height: height,
          alignment: contentAlignment ?? Alignment.center,
          padding: contentPadding,
          decoration: BoxDecoration(
              borderRadius:
                  borderRadius ?? BorderRadius.circular(borderCurve ?? 18),
              color: containerColor ?? Colors.white),
          child: contentWidget,
        ),
      ),
    );
  }
}
