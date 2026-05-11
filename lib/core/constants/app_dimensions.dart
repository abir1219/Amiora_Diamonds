import 'package:flutter/material.dart';

class AppDimensions {
  static double getResponsiveHeight(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return MediaQuery.orientationOf(context) == Orientation.portrait
        ? size.height
        : size.width;
  }

  static double getResponsiveWidth(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return MediaQuery.orientationOf(context) == Orientation.portrait
        ? size.width
        : size.height;
  }
}
