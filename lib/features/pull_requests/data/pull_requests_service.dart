import 'package:dio/dio.dart';
import 'package:github_repos/features/pull_requests/data/models/pull_request_model.dart';
import 'package:github_repos/features/pull_requests/data/responses/pull_request_responses.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'pull_requests_service.g.dart';

@injectable
@RestApi()
abstract interface class PullRequestsService {
  @factoryMethod
  static PullRequestsService create(Dio dio) => PullRequestsService(dio);

  factory PullRequestsService(Dio dio, {String? baseUrl}) =
      _PullRequestsService;

  @GET('/repos/{user}/{repo}/pulls')
  Future<PullRequestResponse> getPullRequestsByUserAndRepo({
    @Path('user') required String user,
    @Path('repo') required String repo,
  });
}
