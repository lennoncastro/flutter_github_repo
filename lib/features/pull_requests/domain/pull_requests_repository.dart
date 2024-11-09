import 'package:github_repos/features/pull_requests/data/src.dart';

abstract interface class PullRequestsRepository {
  Future<List<PullRequest>> getPullRequestsByUserAndRepo({
    required String user,
    required String repo,
  });
}
