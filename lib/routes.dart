import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos/features/pull_requests/presentation/blocs/src.dart';
import 'package:github_repos/features/pull_requests/presentation/pages/src.dart';
import 'package:github_repos/features/search/presentation/blocs/src.dart';
import 'package:github_repos/features/search/presentation/pages/src.dart';
import 'package:github_repos/injection.dart';
import 'package:go_router/go_router.dart';

mixin Routes {
  static GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (_, GoRouterState state) {
          return BlocProvider<SearchBloc>(
            create: (_) {
              return getIt<SearchBloc>();
            },
            child: SearchPage(),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            name: 'pull-requests',
            path: '/pull-requests/:user/:repo',
            builder: (_, GoRouterState state) {
              final user = state.pathParameters['user'] ?? '';
              final repo = state.pathParameters['repo'] ?? '';
              return BlocProvider<PullRequestsBloc>(
                create: (_) {
                  return getIt<PullRequestsBloc>();
                },
                child: PullRequestsPage(user: user, repo: repo),
              );
            },
          ),
        ],
      ),
    ],
  );

  static GoRouter router = _router;
}