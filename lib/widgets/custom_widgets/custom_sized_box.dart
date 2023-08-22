import 'package:flutter/material.dart';

class MySizedBox extends StatelessWidget {
  final num? heightRatio;
  final num? widthRatio;
  final Widget? child;

  const MySizedBox({
    super.key,
    this.widthRatio,
    this.heightRatio,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (widthRatio ?? 0.01),
      height: MediaQuery.of(context).size.height * (heightRatio ?? 0.01),
      child: child,
    );
  }
}
