import 'package:flutter/material.dart';

extension IntExtension on int {
  SizedBox get verticalSpace => SizedBox(
        height: toDouble(),
      );
  SizedBox get horizontalSpace => SizedBox(
        width: toDouble(),
      );
  EdgeInsets get symmetricVertical =>
      EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get symmetricHorizontal =>
      EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get paddingAll => EdgeInsets.all(toDouble());
  EdgeInsets get paddingRight => EdgeInsets.only(right: toDouble());
  EdgeInsets get paddingLeft => EdgeInsets.only(left: toDouble());
  EdgeInsets get paddingTop => EdgeInsets.only(top: toDouble());
  EdgeInsets get paddingBottom => EdgeInsets.only(bottom: toDouble());
  BorderRadius get borderRadius => BorderRadius.circular(toDouble());
}
