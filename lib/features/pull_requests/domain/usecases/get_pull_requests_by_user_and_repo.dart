import 'package:github_repos/features/pull_requests/data/src.dart';
import 'package:github_repos/features/pull_requests/domain/pull_requests_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
final class GetPullRequestsByUserAndRepo {
  GetPullRequestsByUserAndRepo(this._pullRequestsRepository);

  final PullRequestsRepository _pullRequestsRepository;

  Future<List<PullRequest>> call({
    required String user,
    required String repo,
  }) async {
    try {
      return _pullRequestsRepository.getPullRequestsByUserAndRepo(
        user: user,
        repo: repo,
      );
    } catch (_) {
      rethrow;
    }
  }
}
