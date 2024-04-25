import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';
import '../../presentation/views/views.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(childView: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeView(),
          routes: [
            GoRoute(
              path: 'movie/:id',
              name: MovieScreen.name,
              builder: (context, state) {
                final movieId = state.pathParameters['id'] ?? 'no-id';
                return MovieScreen(movieId: movieId);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => const FavoritesView(),
        ),
      ],
    ),
  ],
);

// final appRouter = GoRouter(initialLocation: '/', routes: [
//   // State-Preserving
//   StatefulShellRoute.indexedStack(
//       builder: (context, state, navigationShell) =>
//           HomeScreen(childView: navigationShell),
//       branches: [
//         StatefulShellBranch(routes: <RouteBase>[
//           GoRoute(
//             path: '/',
//             builder: (context, state) {
//               return const HomeView();
//             },
//             routes: [
//               GoRoute(
//                   path: 'movie/:id',
//                   name: MovieScreen.name,
//                   builder: (context, state) {
//                     final movieId = state.pathParameters['id'] ?? 'no-id';
//                     return MovieScreen(movieId: movieId);
//                   },
//                 ),
//             ]
//           )
//         ]),
//         StatefulShellBranch(routes: <RouteBase>[
//           GoRoute(
//             path: '/favorites',
//             builder: (context, state) {
//               return const FavoritesView();
//             },
//           )
//         ]),
//       ]),
// ]);