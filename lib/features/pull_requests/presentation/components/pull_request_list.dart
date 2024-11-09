import 'package:flutter/material.dart';
import 'package:github_repos/core/theme/src.dart';
import 'package:github_repos/features/pull_requests/data/src.dart';
import 'package:github_repos/features/pull_requests/presentation/components/src.dart';

class PullRequestList extends StatelessWidget {
  const PullRequestList(
    this.pullRequests, {
    super.key,
  });

  final List<PullRequest> pullRequests;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index.isOdd) {
            return SizedBox(
              height: Dimensions.sm,
            );
          }
          return PullRequestCard(pullRequests[index]);
        },
        childCount: pullRequests.length,
      ),
    );
  }
}
