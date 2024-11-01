import 'package:flutter/material.dart';
import 'package:github_repos/core/theme/theme.dart';
import 'package:github_repos/features/search/presentation/pages/src.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Git Hub Repos',
      theme: appTheme,
      home: SearchPage(),
    );
  }
}
