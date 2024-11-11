import 'package:dio/dio.dart';
import 'package:github_repos/core/error/src.dart';
import 'package:github_repos/features/pull_requests/data/models/pull_request_model.dart';
import 'package:github_repos/features/pull_requests/data/pull_requests_service.dart';
import 'package:github_repos/features/pull_requests/domain/src.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PullRequestsRepository)
class PullRequestsRepositoryImpl implements PullRequestsRepository {
  PullRequestsRepositoryImpl(this._service);

  final PullRequestsService _service;

  @override
  Future<List<PullRequest>> getPullRequestsByUserAndRepo({
    required String user,
    required String repo,
  }) async {
    try {
      final pullRequests = await _service.getPullRequestsByUserAndRepo(
        user: user,
        repo: repo,
      );
      return pullRequests.where((e) => e.title.isNotEmpty).toList();
    } on DioException catch (e) {
      throw e.asApplicationException;
    } catch (_) {
      throw UnknownError();
    }
  }
}
