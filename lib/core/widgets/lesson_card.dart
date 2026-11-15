import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'code_block.dart';

/// One page of a lesson: an optional title and either text or code.
class LessonCard extends StatelessWidget {
  const LessonCard({
    super.key,
    this.title,
    required this.body,
    this.isCode = false,
  });

  final String? title;
  final String body;
  final bool isCode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title != null) ...[
              Text(title!,
                  textAlign: TextAlign.center, style: AppTextStyles.heading),
              const SizedBox(height: 16),
            ],
            isCode
                ? CodeBlock(body)
                : Text(body,
                    textAlign: TextAlign.center, style: AppTextStyles.body),
          ],
        ),
      ),
    );
  }
}

/// Horizontal, swipeable list of [LessonCard]s.
class LessonCardsPager extends StatelessWidget {
  const LessonCardsPager({super.key, required this.cards});

  final List<LessonCard> cards;

  @override
  Widget build(BuildContext context) {
    return ListView(scrollDirection: Axis.horizontal, children: cards);
  }
}
