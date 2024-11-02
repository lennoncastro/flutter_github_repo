import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:github_repos/features/search/data/src.dart';

class ReposListSliver extends StatelessWidget {
  ReposListSliver({Key? key, required this.repos}) : super(key: key);

  final List<GitHubRepo> repos;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final repo = repos[index];
          return Card(
            key: Key(repo.id.toString()),
            child: ListTile(
              leading: CachedNetworkImage(
                imageUrl: repo.owner.avatarUrl,
                placeholder: (_, __) => const CircularProgressIndicator(),
                errorWidget: (_, __, ___) => const Icon(Icons.error),
              ),
              title: Text(repo.name),
              subtitle: Text(repo.description),
            ),
          );
        },
        childCount: repos.length,
      ),
    );
  }
}
