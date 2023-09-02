import 'package:flutter/material.dart';

class CustomGridViewBuilder extends StatelessWidget {
  final int? itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  const CustomGridViewBuilder(
      {super.key, required this.itemBuilder, this.itemCount});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 240, mainAxisExtent: 200),
        itemBuilder: itemBuilder);
  }
}
