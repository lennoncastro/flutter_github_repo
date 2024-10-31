import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos/features/search/presentation/blocs/src.dart';
import 'package:github_repos/injection.dart';

final class SearchPage extends StatelessWidget {
  final _searchController = TextEditingController();

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
                    SliverAppBar(
                      expandedHeight: 128.0,
                      floating: true,
                      flexibleSpace: FlexibleSpaceBar(
                        titlePadding: EdgeInsetsDirectional.only(
                          start: 16,
                          bottom: 16,
                        ),
                        title: Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _searchController,
                            onEditingComplete: () {
                              context
                                  .read<SearchBloc>()
                                  .add(GetReposByName(_searchController.text));
                            },
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              filled: true,
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          final repo = state.repos[index];
                          return Card(
                            child: ListTile(
                              leading: CachedNetworkImage(
                                imageUrl: repo.owner.avatarUrl,
                                placeholder: (_, __) {
                                  return CircularProgressIndicator();
                                },
                              ),
                              title: Text(repo.name),
                              subtitle: Text(repo.description),
                            ),
                          );
                        },
                        childCount: state.repos.length,
                      ),
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
