import 'package:permission_handler/permission_handler.dart';

/// Abstraction over runtime permissions so view models can be unit tested.
abstract interface class PermissionService {
  Future<bool> requestCamera();
}

class DevicePermissionService implements PermissionService {
  const DevicePermissionService();

  @override
  Future<bool> requestCamera() async =>
      (await Permission.camera.request()).isGranted;
}
