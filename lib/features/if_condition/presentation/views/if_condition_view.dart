import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/lesson_card.dart';
import '../../../../core/widgets/lesson_scaffold.dart';
import '../../data/if_condition_lesson.dart';

class IfConditionView extends StatelessWidget {
  const IfConditionView({super.key});

  @override
  Widget build(BuildContext context) {
    return LessonScaffold(
      title: 'If Condition',
      actionLabel: 'AR',
      onAction: () => context.push(AppRoutes.ifConditionAr),
      content: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: LessonCardsPager(
          cards: [
            for (final page in IfConditionLesson.pages)
              LessonCard(title: page.title, body: page.body, isCode: page.isCode),
          ],
        ),
      ),
    );
  }
}
