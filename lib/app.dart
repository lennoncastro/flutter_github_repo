import 'package:flutter/material.dart';
import 'package:github_repos/core/extensions/src.dart';
import 'package:github_repos/core/theme/src.dart';
import 'package:github_repos/routes.dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget {
  const App({this.initialLocation = '/', super.key});

  final String initialLocation;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: label.app.title,
      theme: appTheme,
      routerConfig: GoRouter(
        initialLocation: initialLocation,
        routes: Routes.r,
      ),
    );
  }
}
