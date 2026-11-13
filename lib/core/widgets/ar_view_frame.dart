import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'gradient_scaffold.dart';

/// Shared layout for AR screens: the camera view in a rounded frame,
/// with optional [overlay] on top of it and [below] widgets under it.
class ArViewFrame extends StatelessWidget {
  const ArViewFrame({
    super.key,
    required this.onCreated,
    this.enableTap = false,
    this.overlay,
    this.below = const [],
  });

  final ArCoreViewCreatedCallback onCreated;
  final bool enableTap;
  final Widget? overlay;
  final List<Widget> below;

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40.h),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 1.4,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Stack(
                    children: [
                      ArCoreView(
                        onArCoreViewCreated: onCreated,
                        enableTapRecognizer: enableTap,
                      ),
                      if (overlay != null)
                        Positioned(top: 20, left: 20, child: overlay!),
                    ],
                  ),
                ),
              ),
            ),
            ...below,
          ],
        ),
      ),
    );
  }
}
