import 'package:freezed_annotation/freezed_annotation.dart';

part 'pull_requests_event.freezed.dart';

@freezed
sealed class PullRequestsEvent with _$PullRequestsEvent {
  const factory PullRequestsEvent.getByUserAndRepo({
    required String user,
    required String repo,
  }) = GetByUserAndRepo;
}
