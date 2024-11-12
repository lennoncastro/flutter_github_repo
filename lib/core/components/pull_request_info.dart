import 'package:flutter/material.dart';
import 'package:github_repos/core/extensions/src.dart';
import 'package:github_repos/core/theme/src.dart';

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
            Text(label.pullRequests.opened(open)),
            Text(label.general.slash),
            Text(label.pullRequests.closed(closed)),
          ],
        ),
      ),
    );
  }
}
