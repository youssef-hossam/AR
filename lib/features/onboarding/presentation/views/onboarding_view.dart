import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/gradient_scaffold.dart';
import '../../../../core/widgets/primary_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 80.h),
            Image.asset(AppAssets.logo, width: 220.w),
            Text(
              'Learn',
              style: GoogleFonts.pottaOne(fontSize: 60.sp, color: Colors.white),
            ),
            const Spacer(),
            PrimaryButton(
              text: 'Start',
              style: AppTextStyles.button(50),
              onTap: () => context.push(AppRoutes.home),
            ),
            SizedBox(height: 70.h),
          ],
        ),
      ),
    );
  }
}
