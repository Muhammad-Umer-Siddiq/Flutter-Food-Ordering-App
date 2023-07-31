import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String insideText;
  const HeaderText({super.key, required this.insideText});

  @override
  Widget build(BuildContext context) {
    return Text(
      insideText,
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
    );
  }
}
