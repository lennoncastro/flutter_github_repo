import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_repos/core/state/status_enum.dart';
import 'package:github_repos/features/pull_requests/data/models/pull_request_model.dart';
import 'package:github_repos/labels.i69n.dart';

part 'pull_requests_state.freezed.dart';

@freezed
class PullRequestsState with _$PullRequestsState {
  const PullRequestsState._();

  const factory PullRequestsState({
    @Default(Status.initial) Status status,
    @Default(<PullRequest>[]) List<PullRequest> pullRequests,
  }) = _PullRequestsState;

  int get open {
    return pullRequests.where((element) => element.state == 'open').length;
  }

  int get closed {
    return pullRequests.where((element) => element.state == 'closed').length;
  }

  bool get isEmptyList => pullRequests.isEmpty;
}

extension PullRequestsStateX on PullRequestsState {
  bool get isLoading => status == Status.loading;
  bool get isSuccess => status == Status.success;
  bool get isRequestError => status == Status.requestError;
  bool get isServerError => status == Status.serverError;
  bool get isUnknownError => status == Status.unknownError;
  bool get noResultsFound => status == Status.noResultsFound;
  bool get isError {
    return isRequestError || isServerError || isUnknownError || noResultsFound;
  }

  Labels get _labels => Labels();

  String get errorMessage {
    return switch (status) {
      Status.requestError => _labels.error.requestError,
      Status.serverError => _labels.error.serverError,
      Status.unknownError => _labels.error.unknownError,
      Status.noResultsFound => _labels.error.noResultsFound,
      Status.noInternetConnection => _labels.error.noInternetConnection,
      Status.success => '',
      Status.initial => '',
      Status.loading => '',
    };
  }
}
