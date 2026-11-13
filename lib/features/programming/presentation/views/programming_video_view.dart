import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/widgets/gradient_scaffold.dart';
import '../view_model/lesson_video_cubit.dart';
import '../view_model/lesson_video_state.dart';

class ProgrammingVideoView extends StatelessWidget {
  const ProgrammingVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Text(
              'Programming',
              style: GoogleFonts.aBeeZee(fontSize: 45.sp, color: Colors.white),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: BlocBuilder<LessonVideoCubit, LessonVideoState>(
                  builder: (context, state) => switch (state) {
                    LessonVideoLoading() =>
                      const Center(child: CircularProgressIndicator()),
                    LessonVideoError(:final message) => Text(message),
                    LessonVideoReady(:final controller, :final aspectRatio) =>
                      AspectRatio(
                        aspectRatio: aspectRatio,
                        child: Chewie(controller: controller),
                      ),
                  },
                ),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
