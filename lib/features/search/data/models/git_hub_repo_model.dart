import 'package:freezed_annotation/freezed_annotation.dart';

part 'git_hub_repo_model.freezed.dart';
part 'git_hub_repo_model.g.dart';

@freezed
class GitHubRepo with _$GitHubRepo {
  const factory GitHubRepo({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String description,
    @Default('') String url,
    @Default(0) @JsonKey(name: "stargazers_count") int stargazersCount,
    @Default(0) @JsonKey(name: "watchers_count") int watchersCount,
    @Default(GitHubRepoOwner()) GitHubRepoOwner owner,
  }) = _GitHubRepoImpl;

  factory GitHubRepo.fromJson(Map<String, dynamic> json) =>
      _$GitHubRepoFromJson(json);
}

@freezed
class GitHubRepoOwner with _$GitHubRepoOwner {
  const factory GitHubRepoOwner({
    @Default('') String login,
    @Default('') @JsonKey(name: "avatar_url") String avatarUrl,
  }) = _GitHubRepoOwner;

  factory GitHubRepoOwner.fromJson(Map<String, dynamic> json) =>
      _$GitHubRepoOwnerFromJson(json);
}
