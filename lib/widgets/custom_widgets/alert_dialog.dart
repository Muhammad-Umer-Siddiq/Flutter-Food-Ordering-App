import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final List<Widget>? actions;
  final String? title;
  final String? content;
  final MainAxisAlignment? actionsAlignment;
  final Color? bgColor;
  final Color? surfaceTintColor;
  final double? elevation;
  final Color? shadowColor;
  final TextStyle? titleTextStyle;
  final TextStyle? contentTextStyle;
  const CustomAlertDialog({
    super.key,
    this.title,
    this.content,
    this.actions,
    this.actionsAlignment,
    this.bgColor,
    this.surfaceTintColor,
    this.elevation,
    this.shadowColor,
    this.titleTextStyle,
    this.contentTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      shadowColor: shadowColor,
      elevation: elevation ?? 10,
      surfaceTintColor: Colors.white,
      backgroundColor: bgColor ?? Colors.red.shade50,
      actionsOverflowButtonSpacing: 10,
      actionsAlignment: actionsAlignment ?? MainAxisAlignment.spaceAround,
      actions: actions,
      title: Text(
        title ?? '',
        textScaleFactor: 1,
        textAlign: TextAlign.center,
        maxLines: 1,
        style: titleTextStyle ??
            const TextStyle(
                fontSize: 23, color: Colors.black, fontWeight: FontWeight.w600),
      ),
      content: Text(
        content ?? '',
        textScaleFactor: 1,
        textAlign: TextAlign.center,
        style: contentTextStyle ??
            const TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
      ),
    );
  }
}
