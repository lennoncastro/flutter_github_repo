import 'package:freezed_annotation/freezed_annotation.dart';

part 'pull_request_model.freezed.dart';
part 'pull_request_model.g.dart';

@freezed
class PullRequest with _$PullRequest {
  const factory PullRequest({
    @Default('') String url,
    @Default(0) int id,
    @Default(0) int number,
    @Default('') String state,
    @Default(false) bool locked,
    @Default('') String title,
    @Default('') String body,
    @Default(User()) User user,
  }) = _PullRequest;

  factory PullRequest.fromJson(Map<String, dynamic> json) =>
      _$PullRequestFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @Default('') String login,
    @Default('') @JsonKey(name: "avatar_url") String avatarUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
