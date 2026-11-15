import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ar/ar_scene_service.dart';
import '../../../../core/services/permission_service.dart';
import '../../domain/variable_value.dart';
import 'variable_value_state.dart';

/// View model for the "if condition" AR screen: the box changes colour
/// depending on the type of value the kid types in.
class VariableValueCubit extends Cubit<VariableValueState> {
  VariableValueCubit({
    required ArSceneService scene,
    required PermissionService permissions,
  })  : _scene = scene,
        _permissions = permissions,
        super(const VariableValueState());

  final ArSceneService _scene;
  final PermissionService _permissions;

  Future<void> init() async {
    final granted = await _permissions.requestCamera();
    emit(state.copyWith(cameraAllowed: granted));
  }

  Future<void> onSceneCreated(ArCoreController controller) async {
    _scene.attach(controller);
    await _scene.drawColoredBox(state.value.color);
  }

  Future<void> updateValue(String input) async {
    final value = VariableValue.parse(input);
    emit(state.copyWith(value: value));
    await _scene.drawColoredBox(value.color);
  }

  @override
  Future<void> close() {
    _scene.dispose();
    return super.close();
  }
}
