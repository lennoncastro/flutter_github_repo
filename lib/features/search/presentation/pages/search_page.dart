import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos/core/components/src.dart';
import 'package:github_repos/core/extensions/src.dart';
import 'package:github_repos/features/search/presentation/blocs/src.dart';
import 'package:github_repos/features/search/presentation/components/src.dart';

final class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ScrollController _scrollController = ScrollController();

  Timer? _debounce = null;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollController.addListener(_handleScrollingDown);
  }

  void _handleScrollingDown() {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 200), () {
      if (!_scrollController.position.isScrollingDown) {
        return;
      }
      context.read<SearchBloc>().add(GetMoreRepos());
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
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
            ],
          ),
        ),
        BlocBuilder<SearchBloc, SearchState>(
          buildWhen: (SearchState previous, SearchState current) {
            return previous.isLoading != current.isLoading;
          },
          builder: (BuildContext context, SearchState state) {
            return Visibility(
              visible: state.isLoading,
              child: BackgroundOverlay(),
            );
          },
        ),
        BlocListener(
          bloc: context.read<SearchBloc>(),
          listenWhen: (SearchState previous, SearchState current) {
            return previous.isError != current.isError;
          },
          listener: (BuildContext context, SearchState state) {
            if (!state.isError) {
              return;
            }
            context.showSnackBar(state.errorMessage);
          },
          child: const SizedBox.shrink(),
        ),
      ],
    );
  }
}
