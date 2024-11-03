import 'package:dio/dio.dart';
import 'package:github_repos/features/search/data/responses/git_hub_repo_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'git_hub_repo_service.g.dart';

@injectable
@RestApi()
abstract interface class GitHubRepoRestService {
  @factoryMethod
  static GitHubRepoRestService create(Dio dio) => GitHubRepoRestService(dio);

  factory GitHubRepoRestService(Dio dio, {String? baseUrl}) =
      _GitHubRepoRestService;

  @GET('/search/repositories?q=language:{name}&sort=stars&page={page}')
  Future<GitHubRepoResponse> getRepositories(
    @Path('name') String name,
    @Path('page') int page,
  );
}
