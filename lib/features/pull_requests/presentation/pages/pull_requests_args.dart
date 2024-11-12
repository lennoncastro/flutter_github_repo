import 'package:freezed_annotation/freezed_annotation.dart';

part 'pull_requests_args.freezed.dart';
part 'pull_requests_args.g.dart';

@freezed
class PullRequestsPageArgs with _$PullRequestsPageArgs {
  const PullRequestsPageArgs._();

  const factory PullRequestsPageArgs({
    required String user,
    required String repo,
  }) = _PullRequestsPageArgs;

  factory PullRequestsPageArgs.fromJson(Map<String, dynamic> json) =>
      _$PullRequestsPageArgsFromJson(json);
}
