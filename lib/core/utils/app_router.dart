import 'package:ar/features/home/presentation/views/home_view.dart';
import 'package:ar/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:ar/features/variables/presentation/views/variables_view.dart';
import 'package:ar/if_condition/presentation/views/if_condition_ar_view.dart';

import 'package:ar/programming/presentation/views/programming_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static String homeView = "/home";
  static String variablesView = "/variables";
  static String ifConditionView = "/IfConditionView";
  static String programmingView = "/ProgrammingView";
  static String ifConditionArView = "/IfConditionArView";

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: homeView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const HomeView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeIn,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: variablesView,
        builder: (context, state) => const VariablesView(),
      ),
      GoRoute(
        path: programmingView,
        builder: (context, state) => const ProgrammingView(),
      ),
      GoRoute(
        path: ifConditionArView,
        builder: (context, state) => IfConditionArView(),
      ),
    ],
  );
}
