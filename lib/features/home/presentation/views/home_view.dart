import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/gradient_scaffold.dart';
import '../../../../core/widgets/primary_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const _lessons = <(String, String)>[
    ('Programming', AppRoutes.programming),
    ('Variables', AppRoutes.variables),
    ('If Condition', AppRoutes.ifCondition),
  ];

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 70.h),
            Image.asset(AppAssets.home, width: 400.w),
            SizedBox(height: 60.h),
            for (final (title, route) in _lessons) ...[
              PrimaryButton(
                text: title,
                style: AppTextStyles.button(),
                onTap: () => context.push(route),
              ),
              SizedBox(height: 20.h),
            ],
          ],
        ),
      ),
    );
  }
}
