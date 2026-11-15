import 'package:get_it/get_it.dart';

import '../ar/ar_scene_service.dart';
import '../services/permission_service.dart';

/// Global service locator.
///
/// Every dependency the app needs is registered here once, so views and
/// view models ask for an abstraction instead of creating it themselves.
final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt
    ..registerLazySingleton<PermissionService>(
      () => const DevicePermissionService(),
    )
    // A fresh AR scene for every AR screen.
    ..registerFactory<ArSceneService>(() => ArCoreSceneService());
}
