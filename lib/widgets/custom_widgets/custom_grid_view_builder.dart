import 'package:flutter/material.dart';

class MyGridViewBuilder extends StatelessWidget {
  final int? itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  const MyGridViewBuilder(
      {super.key, required this.itemBuilder, this.itemCount});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 195),
        itemBuilder: itemBuilder);
  }
}
