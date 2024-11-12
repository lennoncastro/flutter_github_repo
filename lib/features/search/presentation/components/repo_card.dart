import 'package:flutter/material.dart';
import 'package:github_repos/core/components/src.dart';
import 'package:github_repos/core/extensions/src.dart';
import 'package:github_repos/core/theme/src.dart';
import 'package:github_repos/features/search/data/src.dart';

const double _iconSize = 14;

class RepoCard extends StatelessWidget {
  RepoCard({
    required this.repo,
    Key? key,
  }) : super(key: key);

  final GitHubRepo repo;

  Map<String, String> get pathParameters {
    return <String, String>{
      'user': repo.owner.login,
      'repo': repo.name,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      key: Key(repo.id.toString()),
      child: ListTile(
        onTap: () {
          context.goRouteNamed(
            'pull-requests',
            pathParameters: pathParameters,
          );
        },
        leading: SizedBox(
          width: Dimensions.xxxxxl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RemoteSourceImage(url: repo.owner.avatarUrl),
              Text(
                repo.owner.login,
                style: Theme.of(context).textTheme.bodySmallBold,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        title: Text(
          repo.name,
          style: Theme.of(context).textTheme.bodyMediumBold,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              repo.description,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: ThemeColors.onPrimaryColor),
            ),
            Row(
              children: <Widget>[
                const Icon(
                  Icons.star,
                  size: _iconSize,
                  color: ThemeColors.secondaryColor,
                ),
                Text(
                  repo.stargazersCount.toString(),
                  style: Theme.of(context).textTheme.bodyMediumBold,
                ),
                const SizedBox(width: Dimensions.md),
                const Icon(
                  Icons.fork_right_sharp,
                  size: _iconSize,
                  color: ThemeColors.secondaryColor,
                ),
                Text(
                  repo.watchersCount.toString(),
                  style: Theme.of(context).textTheme.bodyMediumBold,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
