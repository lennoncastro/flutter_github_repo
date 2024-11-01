import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos/features/search/presentation/blocs/src.dart';
import 'package:github_repos/features/search/presentation/components/src.dart';
import 'package:github_repos/injection.dart';

final class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (_) {
        return getIt<SearchBloc>()..add(GetReposByName('Java'));
      },
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (BuildContext context, SearchState state) {
          return Stack(
            children: <Widget>[
              Scaffold(
                body: CustomScrollView(
                  slivers: <Widget>[
                    SearchAppBar(onEditingComplete: (String value) {
                      context.read<SearchBloc>().add(GetReposByName(value));
                    }),
                    ReposListSliver(state: state),
                    ErrorSliver(
                      isVisible: state.isRequestError,
                      message: 'Request Error',
                    ),
                    ErrorSliver(
                      isVisible: state.isServerError,
                      message: 'Server Error',
                    ),
                    ErrorSliver(
                      isVisible: state.isUnknownError,
                      message: 'Unknown Error',
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: state.isLoading,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
