import 'dart:ui';

import 'package:flutter/material.dart';

class Dimensions {
  static double get screenHeight {
    return WidgetsBinding.instance.window.physicalSize.height /
        window.devicePixelRatio;
  }

  static double get screenWidth {
    return WidgetsBinding.instance.window.physicalSize.width /
        window.devicePixelRatio;
  }

  static double scaleH(double value) {
    return value * ((screenHeight) / 740);
  }

  static double scaleW(double value) {
    return value * ((screenWidth) / 360);
  }
}
