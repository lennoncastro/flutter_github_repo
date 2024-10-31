import 'package:github_repos/core/error/request_error.dart';
import 'package:github_repos/features/search/data/git_hub_repo_service.dart';
import 'package:github_repos/features/search/data/models/git_hub_repo_model.dart';
import 'package:github_repos/features/search/domain/git_hub_repo_repository.dart';

class GitHubRepoRepositoryImpl implements GitHubRepoRepository {
  GitHubRepoRepositoryImpl(this._service);

  final GitHubRepoRestService _service;

  @override
  Future<List<GitHubRepo>> getRepositories() async {
    try {
      final repositoryResponse = await _service.getRepositories();
      return repositoryResponse.items ?? [];
    } catch (_) {
      throw RequestError();
    }
  }
}
