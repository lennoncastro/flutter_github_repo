import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_repos/features/search/data/models/git_hub_repo_model.dart';

part 'git_hub_repo_response.freezed.dart';
part 'git_hub_repo_response.g.dart';

@freezed
class GitHubRepoResponse with _$GitHubRepoResponse {
  const factory GitHubRepoResponse({
    @Default(<GitHubRepo>[]) List<GitHubRepo> items,
  }) = _GitHubRepoResponseImpl;

  factory GitHubRepoResponse.fromJson(Map<String, dynamic> json) =>
      _$GitHubRepoResponseFromJson(json);
}
