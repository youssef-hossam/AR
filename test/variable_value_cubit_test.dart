import 'package:ar/core/ar/ar_scene_service.dart';
import 'package:ar/core/services/permission_service.dart';
import 'package:ar/features/if_condition/presentation/view_model/variable_value_cubit.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeScene implements ArSceneService {
  final drawn = <Color>[];

  @override
  void attach(ArCoreController controller) {}
  @override
  set onPlaneTap(void Function() callback) {}
  @override
  Future<void> drawClosedBox() async {}
  @override
  Future<void> openBoxAndReveal() async {}
  @override
  Future<void> drawColoredBox(Color color) async => drawn.add(color);
  @override
  void dispose() {}
}

class _FakePermissions implements PermissionService {
  _FakePermissions(this.granted);
  final bool granted;
  @override
  Future<bool> requestCamera() async => granted;
}

void main() {
  test('updating the value recolours the AR box', () async {
    final scene = _FakeScene();
    final cubit = VariableValueCubit(
      scene: scene,
      permissions: _FakePermissions(true),
    );

    await cubit.updateValue('hello');
    expect(cubit.state.label, 'x = hello');
    expect(scene.drawn.last, Colors.blue);

    await cubit.updateValue('7');
    expect(scene.drawn.last, Colors.green);
    await cubit.close();
  });

  test('denied camera permission is reflected in state', () async {
    final cubit = VariableValueCubit(
      scene: _FakeScene(),
      permissions: _FakePermissions(false),
    );
    await cubit.init();
    expect(cubit.state.cameraAllowed, isFalse);
    await cubit.close();
  });
}
