/// One swipeable page of the lesson.
typedef LessonPage = ({String title, String body, bool isCode});

abstract final class IfConditionLesson {
  static const pages = <LessonPage>[
    (
      title: '🧠',
      body: 'You give the computer a condition, it evaluates to either true or '
          'false, and then decides what action to take.\n\n'
          'يعني بتقول للكمبيوتر: "لو حصل كذا، اعمل كذا"، وهو بيشوف الشرط صح ولا غلط، وبعدها يتصرف.',
      isCode: false,
    ),
    (
      title: '🎁 الفكرة الأساسية',
      body: 'تخيل إن عندك بوكس سحري جواه حاجة، وانت مش عارف إيه هي.\n'
          'لكن البوكس ذكي! بيشوف الحاجة اللي جواه، وبيتلوّن حسب نوعها:\n\n'
          '🟢 لو الحاجة رقم (زي 5 أو 100)، البوكس يبقى أخضر.\n'
          '🔵 لو الحاجة كلام (زي "يوسف" أو "سلام")، البوكس يبقى أزرق.\n'
          '🟡 لو الحاجة صح أو غلط (true أو false)، البوكس يبقى أصفر.\n'
          '⚪ لو مش أي واحدة من دول، يبقى البوكس رمادي.',
      isCode: false,
    ),
    (
      title: '🧠 خطوات التفكير بالـ if:',
      body: 'الكمبيوتر بيسأل نفسه خطوة خطوة:\n\n'
          '1️⃣ هل الحاجة دي رقم؟ ✅ خليه أخضر\n'
          '2️⃣ طب هل هي كلام؟ ✅ خليه أزرق\n'
          '3️⃣ طب هل هي صح أو غلط؟ ✅ خليه أصفر\n'
          '4️⃣ لو مش أي حاجة من دول ❌ خليه رمادي',
      isCode: false,
    ),
    (
      title: '🧑‍💻 الكود في البرنامج بيكون كده:',
      body: 'Color getColorByType(dynamic val) {\n'
          '  if (val is int) return Colors.green;\n'
          '  if (val is String) return Colors.blue;\n'
          '  if (val is bool) return Colors.yellow;\n'
          '  return Colors.grey;\n'
          '}',
      isCode: true,
    ),
    (
      title: '🤖',
      body: 'كده الكمبيوتر بقى يفهم إزاي يلوّن البوكس حسب الحاجة اللي جواه!',
      isCode: false,
    ),
  ];
}
