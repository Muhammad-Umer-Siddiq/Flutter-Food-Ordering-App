import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCupertinoAlertDialog extends StatelessWidget {
  final List<Widget>? actions;
  final String? title;
  final String? content;

  final TextStyle? titleTextStyle;
  final TextStyle? contentTextStyle;

  const MyCupertinoAlertDialog({
    super.key,
    this.actions,
    this.title,
    this.content,
    this.titleTextStyle,
    this.contentTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title!,
          textScaleFactor: 1,
          textAlign: TextAlign.center,
          style: titleTextStyle ??
              const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
      content: Text(content!,
          textScaleFactor: 1,
          textAlign: TextAlign.center,
          style: contentTextStyle ??
              const TextStyle(
                fontSize: 17,
                color: Colors.black,
              )),
      actions: actions!,
      key: key,
    );
  }
}
