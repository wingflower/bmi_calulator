
// final router = GoRouter(
//   initialLocation: '/',
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       builder: (context, state) => const MainScreen(),
//     ),
//     GoRoute(
//       path: '/result',
//       builder: (context, state) {
//         final double height =
//             double.parse(state.uri.queryParameters['height']!);
//         final double weight =
//             double.parse(state.uri.queryParameters['weight']!);
//         return ResultScreen(height: height, weight: weight);
//       },
//     ),
//   ],
// );
