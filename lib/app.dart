import 'package:flutter/material.dart';
import 'package:github_repos/core/theme/src.dart';
import 'package:github_repos/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Git Hub Repos',
      theme: appTheme,
      routerConfig: Routes.router,
    );
  }
}
