import 'package:flutter/material.dart';

enum CafeColors {
  blue("Blue", Colors.blue);

  const CafeColors(this.name, this.color);

  final String name;
  final Color color;
}
