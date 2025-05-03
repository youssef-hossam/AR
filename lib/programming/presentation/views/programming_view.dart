import 'package:ar/constants.dart';
import 'package:ar/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgrammingView extends StatelessWidget {
  const ProgrammingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: backGroundDecoration(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              Text(
                'Programming',
                style:
                    GoogleFonts.aBeeZee(fontSize: 45.sp, color: Colors.white),
              ),
              SizedBox(height: 15.h),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                child: Container(
                  width: 100.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      'AR',
                      style: GoogleFonts.pottaOne(
                          fontSize: 32.sp, color: kPrimaryColor),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
