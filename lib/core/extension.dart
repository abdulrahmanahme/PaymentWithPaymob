import 'package:flutter/material.dart';
import 'package:payment/core/size_utils.dart';

extension Size on num {
  double get h => getVerticalSize(toDouble());
  double get w => getHorizontalSize(toDouble());
  SizedBox get hs => SizedBox(height: getVerticalSize(toDouble()));
  SizedBox get ws => SizedBox(width: getHorizontalSize(toDouble()));
}

extension WidgetExtension on Widget {
  Widget onTap(
    Function? function, {
    BorderRadius? borderRadius,
    Color? splashColor,
    Color? hoverColor,
    Color? highlightColor,
  }) {
    return InkWell(
      onTap: function as void Function()?,
    );
  }
}
