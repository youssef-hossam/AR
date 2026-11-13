import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/code_block.dart';
import '../../../../core/widgets/lesson_scaffold.dart';
import '../../data/variables_lesson.dart';
import 'widgets/example_point.dart';

class VariablesView extends StatelessWidget {
  const VariablesView({super.key});

  @override
  Widget build(BuildContext context) {
    return LessonScaffold(
      title: 'Variables',
      actionLabel: 'AR',
      onAction: () => context.push(AppRoutes.variablesAr),
      content: Container(
        width: MediaQuery.sizeOf(context).width * 0.85,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const Text('🧠', style: AppTextStyles.heading),
              const SizedBox(height: 8),
              const Text(VariablesLesson.intro, style: AppTextStyles.body),
              const SizedBox(height: 24),
              const Text('🎁 مثال بسيط', style: AppTextStyles.heading),
              const SizedBox(height: 12),
              for (final point in VariablesLesson.examplePoints)
                ExamplePoint(point),
              const SizedBox(height: 24),
              const Text('🧑‍💻 شكل الكود هيكون كده',
                  style: AppTextStyles.heading),
              const SizedBox(height: 12),
              const CodeBlock(VariablesLesson.code),
              const SizedBox(height: 32),
              const Text(
                VariablesLesson.summary,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
