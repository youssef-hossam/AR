import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTextStyles {
  static TextStyle screenTitle() =>
      GoogleFonts.pottaOne(fontSize: 45.sp, color: Colors.white);

  static TextStyle button([double size = 35]) =>
      GoogleFonts.pottaOne(fontSize: size.sp, color: AppColors.primary);

  static const body = TextStyle(fontSize: 18, height: 1.6);
  static const heading = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  static const code = TextStyle(fontSize: 16, fontFamily: 'monospace');
}
