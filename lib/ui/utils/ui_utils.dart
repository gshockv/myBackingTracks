import 'package:flutter/material.dart';

import 'app_colors.dart';

class UiUtils {
  static Decoration createDarkGradientBackground() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.45, 1.0],
        colors: [
          Color(AppColors.primaryDarkColor),
          Color(AppColors.primaryLightColor)
        ]
      )
    );
  }
}
