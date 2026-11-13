import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/lesson_card.dart';
import '../../../../core/widgets/lesson_scaffold.dart';
import '../../data/programming_lesson.dart';

class ProgrammingView extends StatelessWidget {
  const ProgrammingView({super.key});

  @override
  Widget build(BuildContext context) {
    return LessonScaffold(
      title: 'Programming',
      titleStyle: GoogleFonts.aBeeZee(fontSize: 45.sp, color: Colors.white),
      actionLabel: 'Video',
      onAction: () => context.push(AppRoutes.programmingVideo),
      content: Center(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: LessonCardsPager(
            cards: [
              for (final text in ProgrammingLesson.cards) LessonCard(body: text),
            ],
          ),
        ),
      ),
    );
  }
}
