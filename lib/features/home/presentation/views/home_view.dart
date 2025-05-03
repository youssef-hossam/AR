import 'package:ar/constants.dart';
import 'package:ar/core/utils/app_router.dart';
import 'package:ar/core/utils/assets.dart';
import 'package:ar/core/widgets/custom_button.dart';
import 'package:ar/if_condition/presentation/views/debugoptionsexample.dart';
import 'package:ar/if_condition/presentation/views/if_condtion_view.dart';
import 'package:ar/if_condition/presentation/views/objectgesturesexample.dart';
import 'package:ar/if_condition/presentation/views/objectsonplanesexample.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: backGroundDecoration(),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 70.h,
              ),
              Image.asset(
                AssetsData.home,
                width: 400.w,
              ),
              SizedBox(
                height: 60.h,
              ),
              CustomButton(
                  text: 'Programming',
                  style: GoogleFonts.pottaOne(
                      fontSize: 35.sp, color: kPrimaryColor),
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.programmingView);
                  }),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                  text: 'Variables',
                  style: GoogleFonts.pottaOne(
                      fontSize: 35.sp, color: kPrimaryColor),
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.variablesView);
                  }),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                  text: 'If Condition',
                  style: GoogleFonts.pottaOne(
                      fontSize: 35.sp, color: kPrimaryColor),
                  onTap: () {
                    // GoRouter.of(context).push(AppRouter.ifConditionView);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LocalAndWebObjectsWidget(),
                      ),
                    );
                  }),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
