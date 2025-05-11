import 'package:ar/constants.dart';
import 'package:ar/core/utils/app_router.dart';
import 'package:ar/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          '🧠',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Programming is how we tell the computer what to do, like writing commands that make it draw, play, or solve problems.\n"
                          "💡 It's like giving instructions to a robot to perform specific tasks, and when we write these instructions correctly, the computer executes them precisely.\n",
                          style: TextStyle(fontSize: 18, height: 1.6),
                        ),
                        Text(
                          "  البرمجة هي الطريقة اللي بنقول بيها للكمبيوتر يعمل إيه، زي لما نكتب أوامر بتخليه يرسم، يلعب، أو يحل مشكلة. 💡 تخيل إنك بتدي تعليمات لروبوت علشان يعمل حاجة معينة، ولما تكتب التعليمات صح، الكمبيوتر بينفذها بدقة",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, height: 1.6),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.programmingVideoView);
                },
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
