import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos/core/theme/theme.dart';
import 'package:github_repos/features/search/presentation/blocs/src.dart';
import 'package:github_repos/features/search/presentation/pages/src.dart';
import 'package:github_repos/injection.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Git Hub Repos',
      theme: appTheme,
      home: BlocProvider<SearchBloc>(
        create: (_) {
          return getIt<SearchBloc>();
        },
        child: SearchPage(),
      ),
    );
  }
}
