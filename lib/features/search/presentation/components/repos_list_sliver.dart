import 'package:flutter/material.dart';
import 'package:github_repos/features/search/data/src.dart';
import 'package:github_repos/features/search/presentation/components/repo_card.dart';

class ReposListSliver extends StatelessWidget {
  ReposListSliver({Key? key, required this.repos}) : super(key: key);

  final List<GitHubRepo> repos;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return RepoCard(repo: repos[index]);
        },
        childCount: repos.length,
      ),
    );
  }
}
