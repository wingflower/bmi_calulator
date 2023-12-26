import 'package:bmi_calulator/main/main_screen.dart';
import 'package:bmi_calulator/result/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/result',
      builder: (context, state) {
        final double height =
            double.parse(state.uri.queryParameters['height']!);
        final double weight =
            double.parse(state.uri.queryParameters['weight']!);
        return ResultScreen(height: height, weight: weight);
      },
    ),
  ],
);
