import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Color? containerColor;
  final double? elevation;
  final Widget contentWidget;
  final VoidCallback? cardTap;
  final double? containerWidth;
  final double? containerHeight;
  final BorderRadius? borderRadius;
  final double? borderCurve;
  final Color? cardColor;
  final Color? surfaceTintColor;
  final Color? shadowColor;
  final VoidCallback? cardLongPress;
  final AlignmentGeometry? contentAlignment;
  const MyCard({
    super.key,
    this.containerColor,
    this.elevation,
    this.cardTap,
    this.containerWidth,
    this.containerHeight,
    this.borderRadius,
    this.borderCurve,
    required this.contentWidget,
    this.cardColor,
    this.surfaceTintColor,
    this.shadowColor,
    this.cardLongPress,
    this.contentAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: cardLongPress,
      onTap: cardTap,
      child: Card(
        surfaceTintColor: surfaceTintColor,
        shadowColor: shadowColor,
        color: cardColor ?? Colors.white,
        shape: OutlineInputBorder(
            borderRadius:
                borderRadius ?? BorderRadius.circular(borderCurve ?? 18),
            borderSide: const BorderSide(color: Colors.white)),
        elevation: elevation ?? 1,
        child: Container(
          width: containerWidth,
          height: containerHeight,
          alignment: contentAlignment ?? Alignment.center,
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
