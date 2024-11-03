import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos/core/extensions/scroll_position_extension.dart';
import 'package:github_repos/features/search/presentation/blocs/src.dart';
import 'package:github_repos/features/search/presentation/components/src.dart';
import 'package:github_repos/labels.i69n.dart';

final class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollController.addListener(_handleScrollingDown);
  }

  void _handleScrollingDown() {
    if (_scrollController.position.isScrollingDown) {
      context.read<SearchBloc>().add(GetMoreRepos());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          body: CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SearchAppBar(onEditingComplete: (String value) {
                context.read<SearchBloc>().add(GetInitialReposByName(value));
              }),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (BuildContext context, SearchState state) {
                  return ReposListSliver(repos: state.repos);
                },
              ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (BuildContext context, SearchState state) {
                  return ErrorSliver(
                    isVisible: state.noResultsFound,
                    message: Labels().error.noResultsFound,
                  );
                },
              ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (BuildContext context, SearchState state) {
                  return ErrorSliver(
                    isVisible: state.isRequestError,
                    message: Labels().error.requestError,
                  );
                },
              ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (BuildContext context, SearchState state) {
                  return ErrorSliver(
                    isVisible: state.isServerError,
                    message: Labels().error.serverError,
                  );
                },
              ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (BuildContext context, SearchState state) {
                  return ErrorSliver(
                    isVisible: state.isUnknownError,
                    message: Labels().error.unknownError,
                  );
                },
              ),
            ],
          ),
        ),
        BlocBuilder<SearchBloc, SearchState>(
          builder: (BuildContext context, SearchState state) {
            return Visibility(
              visible: state.isLoading,
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            );
          },
        ),
        BlocBuilder<SearchBloc, SearchState>(
          builder: (BuildContext context, SearchState state) {
            return Visibility(
              visible: state.isLoading,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ],
    );
  }
}
