import 'package:flutter/material.dart';

class BackgroundTile extends StatelessWidget {
  final ImageProvider<Object>? bgImage;
  final Widget? frontContent;
  const BackgroundTile({
    super.key,
    required this.bgImage,
    required this.frontContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          image:
              DecorationImage(fit: BoxFit.cover, opacity: 95, image: bgImage!),
        ),
        child: frontContent);
  }
}
