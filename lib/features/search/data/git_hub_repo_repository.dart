import 'package:dio/dio.dart';
import 'package:github_repos/core/error/request_error.dart';
import 'package:github_repos/core/error/server_error.dart';
import 'package:github_repos/core/error/unknown_error.dart';
import 'package:github_repos/features/search/data/git_hub_repo_service.dart';
import 'package:github_repos/features/search/data/models/git_hub_repo_model.dart';
import 'package:github_repos/features/search/domain/src.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GitHubRepoRepository)
class GitHubRepoRepositoryImpl implements GitHubRepoRepository {
  GitHubRepoRepositoryImpl(this._service);

  final GitHubRepoRestService _service;

  @override
  Future<List<GitHubRepo>> getRepositories(String name) async {
    try {
      final repositoryResponse = await _service.getRepositories(name);
      return List<GitHubRepo>.from(repositoryResponse.items);
    } on DioException catch (e) {
      if (e.type != DioExceptionType.badResponse) {
        throw UnknownError();
      }
      final statusCode = e.response?.statusCode ?? 500;
      if (statusCode >= 400 && statusCode < 500) {
        throw RequestError();
      }
      throw ServerError();
    }
  }
}
