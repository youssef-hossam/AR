import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

import '../constants/app_assets.dart';

/// Everything the app draws in AR goes through this service.
///
/// Views only hand over the native controller; view models decide *what*
/// to draw, and this class knows *how* to draw it with ARCore.
abstract interface class ArSceneService {
  void attach(ArCoreController controller);

  /// Called when the user taps a detected plane.
  set onPlaneTap(void Function() callback);

  /// A closed box with a lid — the "variable" before we look inside.
  Future<void> drawClosedBox();

  /// Lifts the lid with a short animation and reveals the 3D model inside.
  Future<void> openBoxAndReveal();

  /// A single cube coloured by the type of value it holds.
  Future<void> drawColoredBox(Color color);

  void dispose();
}

class ArCoreSceneService implements ArSceneService {
  static const _box = 'box';
  static const _lid = 'lid';
  static const _content = 'object_inside';
  static const _boxColor = Colors.brown;

  ArCoreController? _controller;
  void Function()? _onPlaneTap;

  @override
  void attach(ArCoreController controller) {
    _controller = controller
      ..onPlaneTap = (_) => _onPlaneTap?.call();
  }

  @override
  set onPlaneTap(void Function() callback) => _onPlaneTap = callback;

  @override
  Future<void> drawClosedBox() async {
    final c = _controller;
    if (c == null) return;
    await c.removeNode(nodeName: _box);
    await c.removeNode(nodeName: _lid);
    await c.addArCoreNode(_cube(_box, size: 0.2, y: 0));
    await c.addArCoreNode(_lidNode(0.12));
  }

  @override
  Future<void> openBoxAndReveal() async {
    final c = _controller;
    if (c == null) return;

    await c.removeNode(nodeName: _lid);
    for (var i = 0; i < 10; i++) {
      await c.addArCoreNode(_lidNode(0.12 + i * 0.015));
      await Future<void>.delayed(const Duration(milliseconds: 50));
      await c.removeNode(nodeName: _lid);
    }
    await c.addArCoreNode(_lidNode(0.3));
    await c.removeNode(nodeName: _box);

    await c.addArCoreNode(
      ArCoreReferenceNode(
        name: _content,
        object3DFileName: AppAssets.toucanModel,
        position: vector.Vector3(0, 0.1, -1),
        scale: vector.Vector3(0.4, 0.4, 0.4),
      ),
    );
  }

  @override
  Future<void> drawColoredBox(Color color) async {
    final c = _controller;
    if (c == null) return;
    await c.removeNode(nodeName: _box);
    await c.addArCoreNode(
      ArCoreNode(
        name: _box,
        shape: ArCoreCube(
          size: vector.Vector3.all(0.2),
          materials: [ArCoreMaterial(color: color)],
        ),
        position: vector.Vector3(-0.3, -0.3, -0.3),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    _controller = null;
  }

  ArCoreNode _lidNode(double y) => ArCoreNode(
        name: _lid,
        shape: ArCoreCube(
          size: vector.Vector3(0.2, 0.02, 0.2),
          materials: [ArCoreMaterial(color: _boxColor)],
        ),
        position: vector.Vector3(0, y, -1),
      );

  ArCoreNode _cube(String name, {required double size, required double y}) =>
      ArCoreNode(
        name: name,
        shape: ArCoreCube(
          size: vector.Vector3.all(size),
          materials: [ArCoreMaterial(color: _boxColor)],
        ),
        position: vector.Vector3(0, y, -1),
      );
}
