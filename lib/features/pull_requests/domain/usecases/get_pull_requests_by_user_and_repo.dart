import 'package:github_repos/features/pull_requests/data/src.dart';
import 'package:github_repos/features/pull_requests/domain/pull_requests_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetPullRequestsByUserAndRepo {
  GetPullRequestsByUserAndRepo(this.pullRequestsRepository);

  final PullRequestsRepository pullRequestsRepository;

  Future<List<PullRequest>> call({
    required String user,
    required String repo,
  }) async {
    return pullRequestsRepository.getPullRequestsByUserAndRepo(
      user: user,
      repo: repo,
    );
  }
}
