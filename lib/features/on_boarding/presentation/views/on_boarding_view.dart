import 'package:ar/constants.dart';
import 'package:ar/core/utils/app_router.dart';
import 'package:ar/core/utils/assets.dart';
import 'package:ar/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: backGroundDecoration(),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 80.h,
              ),
              Image.asset(
                'assets/images/logo.png',
                width: 220.w,
              ),
              Text(
                'Learn',
                style:
                    GoogleFonts.pottaOne(fontSize: 60.sp, color: Colors.white),
              ),
              SizedBox(
                height: 90.h,
              ),
              const Spacer(),
              CustomButton(
                text: 'Start',
                style:
                    GoogleFonts.pottaOne(fontSize: 50.sp, color: kPrimaryColor),
                onTap: () => GoRouter.of(context).push(AppRouter.homeView),
              ),
              SizedBox(
                height: 70.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
