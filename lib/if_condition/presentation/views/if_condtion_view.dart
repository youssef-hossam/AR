import 'package:ar/constants.dart';
import 'package:ar/core/utils/app_router.dart';
import 'package:ar/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class IfCondtionView extends StatelessWidget {
  const IfCondtionView({super.key});

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
                'If Condition',
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
                          '🧠 if',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'You give the computer a condition, it evaluates to either true or false, and then decides what action to take.\n'
                          'يعني بتقول للكمبيوتر: "لو حصل كذا، اعمل كذا"، وهو بيشوف الشرط صح ولا غلط، وبعدها يتصرف.',
                          style: TextStyle(fontSize: 18, height: 1.6),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          '🎁 الفكرة الأساسية',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'تخيل إن عندك بوكس سحري جواه حاجة، وانت مش عارف إيه هي.\n'
                          'لكن البوكس ذكي! بيشوف الحاجة اللي جواه، وبيتلوّن حسب نوعها:',
                          style: TextStyle(fontSize: 18, height: 1.5),
                        ),
                        const SizedBox(height: 16),
                        _coloredPoint('🟢',
                            'لو الحاجة رقم (زي 5 أو 100)، البوكس يبقى أخضر.'),
                        _coloredPoint('🔵',
                            'لو الحاجة كلام (زي "يوسف" أو "سلام")، البوكس يبقى أزرق.'),
                        _coloredPoint('🟡',
                            'لو الحاجة صح أو غلط (true أو false)، البوكس يبقى أصفر.'),
                        _coloredPoint(
                            '⚪', 'لو مش أي واحدة من دول، يبقى البوكس رمادي.'),
                        const SizedBox(height: 24),
                        const Text(
                          '🧠 خطوات التفكير بالـ if:',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'الكمبيوتر بيسأل نفسه خطوة خطوة:',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 12),
                        _numberedStep('1', 'هل الحاجة دي رقم؟ ✅ خليه أخضر'),
                        _numberedStep('2', 'طب هل هي كلام؟ ✅ خليه أزرق'),
                        _numberedStep('3', 'طب هل هي صح أو غلط؟ ✅ خليه أصفر'),
                        _numberedStep('4', 'لو مش أي حاجة من دول ❌ خليه رمادي'),
                        const SizedBox(height: 24),
                        const Text(
                          '🧑‍💻 الكود في البرنامج بيكون كده:',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '''Color _getColorByType(dynamic val) {
                      if (val is int) return Colors.green;
                      if (val is String) return Colors.blue;
                      if (val is bool) return Colors.yellow;
                      return Colors.grey;
                    }''',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'monospace',
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        const Center(
                          child: Text(
                            '🤖 كده الكمبيوتر بقى يفهم إزاي يلوّن البوكس حسب الحاجة اللي جواه!',
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
                  GoRouter.of(context).push(AppRouter.ifConditionArView);
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

  static Widget _coloredPoint(String emoji, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 18, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _numberedStep(String number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('🔹 $number.', style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 18, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
