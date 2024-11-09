import 'package:flutter/material.dart';
import 'package:github_repos/core/theme/src.dart';
import 'package:github_repos/labels.i69n.dart';

class PullRequestInfo extends StatelessWidget {
  const PullRequestInfo({
    required this.open,
    required this.closed,
    super.key,
  });

  final int open;

  final int closed;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.md),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: <Widget>[
            Text(Labels().pullRequests.opened(open)),
            Text(Labels().general.slash),
            Text(Labels().pullRequests.closed(closed)),
          ],
        ),
      ),
    );
  }
}
