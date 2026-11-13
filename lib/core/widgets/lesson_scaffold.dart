import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_text_styles.dart';
import 'gradient_scaffold.dart';
import 'primary_button.dart';

/// Shared layout for every lesson screen:
/// title → white content card → action button (e.g. "AR" or "Video").
class LessonScaffold extends StatelessWidget {
  const LessonScaffold({
    super.key,
    required this.title,
    required this.content,
    required this.actionLabel,
    required this.onAction,
    this.titleStyle,
  });

  final String title;
  final Widget content;
  final String actionLabel;
  final VoidCallback onAction;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Text(title, style: titleStyle ?? AppTextStyles.screenTitle()),
            SizedBox(height: 15.h),
            Expanded(child: content),
            SizedBox(height: 20.h),
            PrimaryButton(
              text: actionLabel,
              style: AppTextStyles.button(32),
              onTap: onAction,
              width: 110,
              height: 50,
              radius: 20,
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
