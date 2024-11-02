import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos/features/search/presentation/blocs/src.dart';
import 'package:github_repos/features/search/presentation/components/src.dart';

final class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollController.addListener(() {
      if (_shouldLoadMoreItems()) {
        context.read<SearchBloc>().add(GetMoreRepos());
      }
    });
  }

  bool _shouldLoadMoreItems() {
    return _scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (BuildContext context, SearchState state) {
        return Stack(
          children: <Widget>[
            Scaffold(
              body: CustomScrollView(
                controller: _scrollController,
                slivers: <Widget>[
                  SearchAppBar(onEditingComplete: (String value) {
                    context
                        .read<SearchBloc>()
                        .add(GetInitialReposByName(value));
                  }),
                  ReposListSliver(repos: state.repos),
                  ErrorSliver(
                    isVisible: state.noResultsFound,
                    message: 'No results found',
                  ),
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
    );
  }
}
