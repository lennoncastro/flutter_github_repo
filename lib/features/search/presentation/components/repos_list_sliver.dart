import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:github_repos/features/search/presentation/blocs/src.dart';

class ReposListSliver extends StatelessWidget {
  final SearchState state;

  const ReposListSliver({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final repo = state.repos[index];
          return Card(
            child: ListTile(
              leading: CachedNetworkImage(
                imageUrl: repo.owner.avatarUrl,
                placeholder: (_, __) => const CircularProgressIndicator(),
              ),
              title: Text(repo.name),
              subtitle: Text(repo.description),
            ),
          );
        },
        childCount: state.repos.length,
      ),
    );
  }
}
