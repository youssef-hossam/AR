import 'package:flutter/material.dart';

import '../theme/app_decorations.dart';

/// Scaffold with the app's purple → blue gradient behind [child].
class GradientScaffold extends StatelessWidget {
  const GradientScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: AppDecorations.background,
        child: child,
      ),
    );
  }
}
