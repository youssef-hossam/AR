import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppDecorations {
  static const background = BoxDecoration(
    gradient: LinearGradient(
      colors: [AppColors.gradientStart, AppColors.gradientEnd],
    ),
  );
}
