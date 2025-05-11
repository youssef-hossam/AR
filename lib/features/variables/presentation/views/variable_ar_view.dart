import 'package:ar/core/utils/assets.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class VariableBoxArView extends StatefulWidget {
  const VariableBoxArView({super.key});

  @override
  State<VariableBoxArView> createState() => _VariableBoxArViewState();
}

class _VariableBoxArViewState extends State<VariableBoxArView> {
  late ArCoreController arCoreController;

  @override
  void initState() {
    super.initState();
    Permission.camera.request();
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;

    arCoreController.onPlaneTap = _handlePlaneTap;
    _drawBox();
  }

  void _handlePlaneTap(List<ArCoreHitTestResult> hits) async {
    // إزالة الغطاء إن وُجد
    await arCoreController.removeNode(nodeName: "lid");

    // أنيميشن بسيط لتحريك الغطاء لأعلى
    for (int i = 0; i < 10; i++) {
      final newY = 0.12 + i * 0.015;
      final lidNode = ArCoreNode(
        name: "lid",
        shape: ArCoreCube(
          size: vector.Vector3(0.2, 0.02, 0.2),
          materials: [ArCoreMaterial(color: Colors.brown)],
        ),
        position: vector.Vector3(0, newY, -1),
      );

      await arCoreController.addArCoreNode(lidNode);
      await Future.delayed(const Duration(milliseconds: 50));
      await arCoreController.removeNode(nodeName: "lid");
    }

    // وضع الغطاء في موضعه النهائي
    await arCoreController.addArCoreNode(ArCoreNode(
      name: "lid",
      shape: ArCoreCube(
        size: vector.Vector3(0.2, 0.02, 0.2),
        materials: [ArCoreMaterial(color: Colors.brown)],
      ),
      position: vector.Vector3(0, 0.3, -1),
    ));

    // إزالة الصندوق نفسه
    await arCoreController.removeNode(nodeName: "box");

    // عرض المجسم ثلاثي الأبعاد في نفس مكان الصندوق
    await arCoreController.addArCoreNode(ArCoreReferenceNode(
      name: "object_inside",
      object3DFileName: "toucan.sfb",
      position: vector.Vector3(0, 0.1, -1), // وسط مكان الصندوق
      scale: vector.Vector3(0.2, 0.2, 0.2),
    ));
  }

  void _drawBox() {
    arCoreController.removeNode(nodeName: "box");
    arCoreController.removeNode(nodeName: "lid");

    // الصندوق
    final box = ArCoreNode(
      name: "box",
      shape: ArCoreCube(
        size: vector.Vector3(0.2, 0.2, 0.2),
        materials: [ArCoreMaterial(color: Colors.brown)],
      ),
      position: vector.Vector3(0, 0, -1),
    );

    // الغطاء فوق الصندوق
    final lid = ArCoreNode(
      name: "lid",
      shape: ArCoreCube(
        size: vector.Vector3(0.2, 0.02, 0.2),
        materials: [ArCoreMaterial(color: Colors.brown)],
      ),
      position: vector.Vector3(0, 0.12, -1),
    );

    arCoreController.addArCoreNode(box);
    arCoreController.addArCoreNode(lid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: backGroundDecoration(),
            ),
            Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: ArCoreView(
                        onArCoreViewCreated: _onArCoreViewCreated,
                        enableTapRecognizer: true,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
