import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';
import '../../presentation/views/views.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        return HomeScreen(pageindex: pageIndex);
      },
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
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
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