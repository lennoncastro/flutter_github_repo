import 'package:dio/dio.dart';
import 'package:github_repos/features/search/data/models/git_hub_repo_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'git_hub_repo_service.g.dart';

@injectable
@RestApi()
abstract class GitHubRepoRestService {
  @factoryMethod
  static GitHubRepoRestService create(Dio dio) => GitHubRepoRestService(dio);

  factory GitHubRepoRestService(Dio dio, {String? baseUrl}) =
      _GitHubRepoRestService;

  @GET('/search/repositories?q=language:Java&sort=stars&page=1')
  Future<GitHubRepoResponse> getRepositories();
}
