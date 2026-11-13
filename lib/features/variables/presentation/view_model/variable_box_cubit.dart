import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ar/ar_scene_service.dart';
import '../../../../core/services/permission_service.dart';
import 'variable_box_state.dart';

/// View model for the "variable = box" AR experience.
class VariableBoxCubit extends Cubit<VariableBoxState> {
  VariableBoxCubit({
    required ArSceneService scene,
    required PermissionService permissions,
  })  : _scene = scene,
        _permissions = permissions,
        super(VariableBoxState.idle);

  final ArSceneService _scene;
  final PermissionService _permissions;

  Future<void> init() async {
    final granted = await _permissions.requestCamera();
    if (!granted) emit(VariableBoxState.permissionDenied);
  }

  Future<void> onSceneCreated(ArCoreController controller) async {
    _scene
      ..attach(controller)
      ..onPlaneTap = openBox;
    await _scene.drawClosedBox();
    emit(VariableBoxState.closed);
  }

  Future<void> openBox() async {
    if (state != VariableBoxState.closed) return;
    emit(VariableBoxState.opening);
    await _scene.openBoxAndReveal();
    emit(VariableBoxState.opened);
  }

  @override
  Future<void> close() {
    _scene.dispose();
    return super.close();
  }
}
