import 'package:ar/constants.dart';
import 'package:ar/core/utils/app_router.dart';
import 'package:ar/core/utils/assets.dart';
import 'package:ar/features/variables/presentation/views/widgets/example_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class VariablesView extends StatelessWidget {
  const VariablesView({super.key});

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
                'Variables',
                style:
                    GoogleFonts.pottaOne(fontSize: 45.sp, color: Colors.white),
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
                        const Text(
                          '🧠',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'A variable in programming is like an empty box where we can store something, '
                          'and we can change its contents anytime.\n\n'
                          'يعني في البرمجة، المتغير هو زي بوكس فاضي تقدر تحط فيه حاجة، وتغيّرها في أي وقت.',
                          style: TextStyle(fontSize: 18, height: 1.6),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          '🎁 مثال بسيط',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        examplePoint('تخيل إن عندك بوكس اسمه "name".'),
                        examplePoint('في الأول، تحط فيه الاسم "Reya".'),
                        examplePoint(
                            'بعد شوية، ممكن تغيّر اللي جواه وتحط اسم تاني زي "Ali".'),
                        const SizedBox(height: 24),
                        const Text(
                          '🧑‍💻 شكل الكود هيكون كده',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            '''String name = "Reya";\nname = "Ali";''',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'monospace',
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        const Center(
                          child: Text(
                            '🤖 كده إحنا فهمنا يعني إيه متغير: بوكس بيخزن حاجة، ونقدر نغيرها في أي وقت!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.variableArView);
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
