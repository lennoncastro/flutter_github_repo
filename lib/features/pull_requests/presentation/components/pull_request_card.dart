import 'package:flutter/material.dart';
import 'package:github_repos/core/components/src.dart';
import 'package:github_repos/core/theme/src.dart';
import 'package:github_repos/features/pull_requests/data/src.dart';

class PullRequestCard extends StatelessWidget {
  const PullRequestCard(this.pullRequest);

  final PullRequest pullRequest;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: RemoteSourceImage(
              url: pullRequest.user.avatarUrl,
            ),
            title: Text(
              pullRequest.user.login,
              style: Theme.of(context).textTheme.bodySmallBold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ListTile(
            title: Text(
              pullRequest.title,
              style: Theme.of(context).textTheme.bodyMediumBold,
            ),
            subtitle: Text(
              pullRequest.body,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: ThemeColors.onPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
