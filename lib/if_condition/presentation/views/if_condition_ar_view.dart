import 'package:ar/core/utils/assets.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class IfConditionArView extends StatefulWidget {
  const IfConditionArView({super.key});

  @override
  State<IfConditionArView> createState() => _IfConditionArViewState();
}

class _IfConditionArViewState extends State<IfConditionArView> {
  late ArCoreController arCoreController;

  String variableName = "x";
  dynamic variableValue = 5;

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
    _drawBox();
  }

  void _drawBox() {
    arCoreController.removeNode(nodeName: "box");

    final box = ArCoreCube(
      size: vector.Vector3(0.2, 0.2, 0.2),
      materials: [ArCoreMaterial(color: _getColorByType(variableValue))],
    );

    final node = ArCoreNode(
      name: "box",
      shape: box,
      position: vector.Vector3(-0.3, -0.3, -0.3),
      scale: vector.Vector3(1, 1, 1),
    );

    arCoreController.addArCoreNode(node);
  }

  Color _getColorByType(dynamic val) {
    if (val is int) return Colors.green;
    if (val is String) return Colors.blue;
    if (val is bool) return Colors.yellow;
    return Colors.grey;
  }

  void _showInputDialog() {
    final controller = TextEditingController(text: "$variableValue");
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final mediaQuery = MediaQuery.of(context);
        final bottomPadding = mediaQuery.viewInsets.bottom;

        return Padding(
          padding: EdgeInsets.only(
            bottom: bottomPadding,
            left: 16,
            right: 16,
            top: 20,
          ),
          child: Wrap(
            children: [
              Center(
                child: Text(
                  "غيّر قيمة المتغير",
                  style: GoogleFonts.roboto(fontSize: 20),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller,
                decoration: const InputDecoration(labelText: "القيمة الجديدة"),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    final input = controller.text.trim();
                    Navigator.of(context).pop();

                    setState(() {
                      if (input.toLowerCase() == "true" ||
                          input.toLowerCase() == "false") {
                        variableValue = input.toLowerCase() == "true";
                      } else if (int.tryParse(input) != null) {
                        variableValue = int.parse(input);
                      } else {
                        variableValue = input;
                      }
                    });

                    _drawBox();
                  },
                  child: const Text("تأكيد"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final valueText = "$variableName = $variableValue";

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      valueText,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                FloatingActionButton(
                  onPressed: _showInputDialog,
                  child: const Icon(Icons.edit),
                  tooltip: "تغيير قيمة المتغير",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
