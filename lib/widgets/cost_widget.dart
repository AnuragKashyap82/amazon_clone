import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CostWidget extends StatelessWidget {
  final Color color;
  final double cost;

  const CostWidget({Key? key, required this.color, required this.cost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Rs.",
          style: TextStyle(
              fontSize: 10, color: color, fontFeatures: [FontFeature.superscripts()]),
        ),
        Text(
          cost.toInt().toString(),
          style: TextStyle(fontSize: 25, color: color, fontWeight: FontWeight.bold),
        ),
        Text(
          (cost - cost.toInt()).toString(),
          style: TextStyle(
              fontSize: 10, color: color, fontFeatures: [FontFeature.superscripts()]),
        )
      ],
    );
  }
}
