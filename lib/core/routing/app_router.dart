import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/home_view.dart';
import '../../features/if_condition/presentation/view_model/variable_value_cubit.dart';
import '../../features/if_condition/presentation/views/if_condition_ar_view.dart';
import '../../features/if_condition/presentation/views/if_condition_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/programming/presentation/view_model/lesson_video_cubit.dart';
import '../../features/programming/presentation/views/programming_video_view.dart';
import '../../features/programming/presentation/views/programming_view.dart';
import '../../features/variables/presentation/view_model/variable_box_cubit.dart';
import '../../features/variables/presentation/views/variable_box_ar_view.dart';
import '../../features/variables/presentation/views/variables_view.dart';
import '../ar/ar_scene_service.dart';
import '../constants/app_assets.dart';
import '../di/service_locator.dart';
import '../services/permission_service.dart';
import 'app_routes.dart';

abstract final class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (_, __) => const OnboardingView(),
      ),
      GoRoute(
        path: AppRoutes.home,
        pageBuilder: (_, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomeView(),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: CurveTween(curve: Curves.easeIn).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.programming,
        builder: (_, __) => const ProgrammingView(),
      ),
      GoRoute(
        path: AppRoutes.programmingVideo,
        builder: (_, __) => BlocProvider(
          create: (_) => LessonVideoCubit(AppAssets.programmingVideo)..load(),
          child: const ProgrammingVideoView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.variables,
        builder: (_, __) => const VariablesView(),
      ),
      GoRoute(
        path: AppRoutes.variablesAr,
        builder: (_, __) => BlocProvider(
          create: (_) => VariableBoxCubit(
            scene: getIt<ArSceneService>(),
            permissions: getIt<PermissionService>(),
          )..init(),
          child: const VariableBoxArView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.ifCondition,
        builder: (_, __) => const IfConditionView(),
      ),
      GoRoute(
        path: AppRoutes.ifConditionAr,
        builder: (_, __) => BlocProvider(
          create: (_) => VariableValueCubit(
            scene: getIt<ArSceneService>(),
            permissions: getIt<PermissionService>(),
          )..init(),
          child: const IfConditionArView(),
        ),
      ),
    ],
  );
}
