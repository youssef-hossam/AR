import 'package:ar/constants.dart';
import 'package:ar/core/utils/app_router.dart';
import 'package:ar/core/utils/assets.dart';
import 'package:ar/if_condition/presentation/views/widgets/color_points.dart';
import 'package:ar/if_condition/presentation/views/widgets/number_step.dart';
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.7, // حسب التصميم المطلوب
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        // 🧠 الفكرة الأولى
                        _buildCard(
                          context,
                          '🧠',
                          "You give the computer a condition, it evaluates to either true or false, and then decides what action to take.\n\n"
                              "يعني بتقول للكمبيوتر: \"لو حصل كذا، اعمل كذا\"، وهو بيشوف الشرط صح ولا غلط، وبعدها يتصرف.",
                        ),

                        // 🎁 الفكرة الأساسية
                        _buildCard(
                          context,
                          '🎁 الفكرة الأساسية',
                          "تخيل إن عندك بوكس سحري جواه حاجة، وانت مش عارف إيه هي.\n"
                              "لكن البوكس ذكي! بيشوف الحاجة اللي جواه، وبيتلوّن حسب نوعها:\n\n"
                              "🟢 لو الحاجة رقم (زي 5 أو 100)، البوكس يبقى أخضر.\n"
                              "🔵 لو الحاجة كلام (زي \"يوسف\" أو \"سلام\")، البوكس يبقى أزرق.\n"
                              "🟡 لو الحاجة صح أو غلط (true أو false)، البوكس يبقى أصفر.\n"
                              "⚪ لو مش أي واحدة من دول، يبقى البوكس رمادي.",
                        ),

                        // 🧠 خطوات التفكير بالـ if
                        _buildCard(
                          context,
                          '🧠 خطوات التفكير بالـ if:',
                          "الكمبيوتر بيسأل نفسه خطوة خطوة:\n\n"
                              "1️⃣ هل الحاجة دي رقم؟ ✅ خليه أخضر\n"
                              "2️⃣ طب هل هي كلام؟ ✅ خليه أزرق\n"
                              "3️⃣ طب هل هي صح أو غلط؟ ✅ خليه أصفر\n"
                              "4️⃣ لو مش أي حاجة من دول ❌ خليه رمادي",
                        ),

                        // 🧑‍💻 الكود في البرنامج
                        _buildCard(
                          context,
                          '🧑‍💻 الكود في البرنامج بيكون كده:',
                          '''Color _getColorByType(dynamic val) {
                  if (val is int) return Colors.green;
                  if (val is String) return Colors.blue;
                  if (val is bool) return Colors.yellow;
                  return Colors.grey;
                }''',
                          isCode: true,
                        ),

                        // الخاتمة
                        _buildCard(
                          context,
                          '🤖',
                          'كده الكمبيوتر بقى يفهم إزاي يلوّن البوكس حسب الحاجة اللي جواه!',
                        ),
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

  Widget _buildCard(BuildContext context, String title, String content,
      {bool isCode = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              isCode
                  ? Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        content,
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 16,
                        ),
                      ),
                    )
                  : Text(
                      content,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18, height: 1.6),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
