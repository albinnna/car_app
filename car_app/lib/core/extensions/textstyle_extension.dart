import 'package:flutter/material.dart';

extension TextstyleExtension on TextStyle {
  TextStyle setSize(double size) => copyWith(fontSize: size);
}
