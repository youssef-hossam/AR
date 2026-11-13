import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

/// Big white rounded button used on the main menus.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.style,
    required this.onTap,
    this.width = 300,
    this.height = 70,
    this.radius = 10,
  });

  final String text;
  final TextStyle style;
  final VoidCallback onTap;
  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(radius.r),
        ),
        child: Center(child: Text(text, style: style)),
      ),
    );
  }
}
