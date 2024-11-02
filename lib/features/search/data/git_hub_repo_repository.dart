import 'package:dio/dio.dart';
import 'package:github_repos/core/error/error_extesion.dart';
import 'package:github_repos/core/error/src.dart';
import 'package:github_repos/features/search/data/git_hub_repo_service.dart';
import 'package:github_repos/features/search/data/models/git_hub_repo_model.dart';
import 'package:github_repos/features/search/domain/src.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GitHubRepoRepository)
class GitHubRepoRepositoryImpl implements GitHubRepoRepository {
  GitHubRepoRepositoryImpl(this._service);

  final GitHubRepoRestService _service;

  @override
  Future<List<GitHubRepo>> getRepositories(String name, int page) async {
    try {
      final repositoryResponse = await _service.getRepositories(name, page);
      return List<GitHubRepo>.from(repositoryResponse.items);
    } on DioException catch (e) {
      throw e.asApplicationException;
    } catch (_) {
      throw UnknownError();
    }
  }
}
