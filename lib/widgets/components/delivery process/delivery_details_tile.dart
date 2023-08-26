import 'package:flutter/material.dart';

import '../../custom widgets/sized_box.dart';

class DeliveryDetailsTile extends StatefulWidget {
  final String? details;
  final String? title;
  const DeliveryDetailsTile({super.key, this.details, this.title});

  @override
  State<DeliveryDetailsTile> createState() => _DeliveryDetailsTileState();
}

class _DeliveryDetailsTileState extends State<DeliveryDetailsTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MySizedBox(
          widthRatio: 0.20,
          heightRatio: 0.04,
          child: Text(
            widget.title!,
            textAlign: TextAlign.start,
            textScaleFactor: 1,
            maxLines: 1,
            style: const TextStyle(
                fontSize: 13.5,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ),
        MySizedBox(
          heightRatio: 0.04,
          child: Text(
            widget.details.toString(),
            textScaleFactor: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12.5, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
