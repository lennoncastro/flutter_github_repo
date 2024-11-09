import 'package:github_repos/features/pull_requests/data/models/pull_request_model.dart';
import 'package:github_repos/features/pull_requests/data/pull_requests_service.dart';
import 'package:github_repos/features/pull_requests/domain/src.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PullRequestsRepository)
class PullRequestsRepositoryImpl implements PullRequestsRepository {
  PullRequestsRepositoryImpl(this.service);

  final PullRequestsService service;

  @override
  Future<List<PullRequest>> getPullRequestsByUserAndRepo({
    required String user,
    required String repo,
  }) async {
    try {
      final pullRequests = await service.getPullRequestsByUserAndRepo(
        user: user,
        repo: repo,
      );
      return pullRequests.where((e) => e.title.isNotEmpty).toList();
    } catch (_) {
      rethrow;
    }
  }
}
