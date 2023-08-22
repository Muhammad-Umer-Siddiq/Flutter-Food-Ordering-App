import 'package:flutter/material.dart';

class OnScreenButton extends StatelessWidget {
  final Color? textColor;
  final Color? buttonColor;
  final String? buttonText;
  final double? textSize;
  final VoidCallback? buttonSingleTap;
  final VoidCallback? buttonLongPress;
  const OnScreenButton({
    super.key,
    this.textColor,
    this.buttonColor = Colors.white24,
    this.buttonSingleTap,
    this.buttonText,
    this.buttonLongPress,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: buttonLongPress,
      onTap: buttonSingleTap,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Container(
            alignment: Alignment.center,
            color: buttonColor ?? Colors.white24,
            child: Text(
              buttonText!,
              style: TextStyle(
                  fontSize: textSize ?? 27, color: textColor ?? Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
