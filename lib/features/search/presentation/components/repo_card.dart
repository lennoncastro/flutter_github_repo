import 'package:flutter/material.dart';
import 'package:github_repos/core/theme/src.dart';
import 'package:github_repos/features/search/data/src.dart';
import 'package:github_repos/features/search/presentation/components/remote_source_image.dart';

class RepoCard extends StatelessWidget {
  RepoCard({
    required this.repo,
    Key? key,
  }) : super(key: key);

  final GitHubRepo repo;

  final double _iconSize = 14;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: Key(repo.id.toString()),
      child: ListTile(
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
                Icon(
                  Icons.star,
                  size: _iconSize,
                  color: ThemeColors.secondaryColor,
                ),
                Text(
                  repo.stargazersCount.toString(),
                  style: Theme.of(context).textTheme.bodyMediumBold,
                ),
                const SizedBox(width: Dimensions.md),
                Icon(
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
