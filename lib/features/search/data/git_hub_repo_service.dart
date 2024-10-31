import 'package:dio/dio.dart';
import 'package:github_repos/features/search/data/models/git_hub_repo_model.dart';
import 'package:retrofit/retrofit.dart';

part 'git_hub_repo_service.g.dart';

@RestApi(baseUrl: 'https://api.github.com/')
abstract class GitHubRepoRestService {
  factory GitHubRepoRestService(Dio dio, {String? baseUrl}) =
      _GitHubRepoRestService;

  @GET('/search/repositories?q=language:Java&sort=stars&page=1')
  Future<GitHubRepoResponse> getRepositories();
}
