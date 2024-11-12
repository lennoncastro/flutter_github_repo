import 'package:flutter/material.dart';
import 'package:github_repos/core/theme/src.dart';
import 'package:go_router/go_router.dart';

class PullRequestAppBar extends StatelessWidget {
  const PullRequestAppBar({
    required this.repo,
    super.key,
  });

  final String repo;

  final double _expandedHeight = 128;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        onPressed: context.pop,
        icon: const Icon(
          Icons.chevron_left,
        ),
      ),
      expandedHeight: _expandedHeight,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsetsDirectional.only(
          start: Dimensions.sm,
          bottom: Dimensions.md,
        ),
        title: Container(
          padding: const EdgeInsets.all(Dimensions.sm),
          child: Text(repo),
        ),
      ),
    );
  }
}
