import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_repos/features/pull_requests/data/models/pull_request_model.dart';
import 'package:github_repos/labels.i69n.dart';

part 'pull_requests_state.freezed.dart';

enum PullRequestsStatus {
  initial,
  loading,
  success,
  requestError,
  noResultsFound,
  serverError,
  unknownError
}

@freezed
class PullRequestsState with _$PullRequestsState {
  const PullRequestsState._();

  const factory PullRequestsState({
    @Default(PullRequestsStatus.initial) PullRequestsStatus status,
    @Default(<PullRequest>[]) List<PullRequest> pullRequests,
  }) = _PullRequestsState;

  int get open {
    return pullRequests.where((element) => element.state == 'open').length;
  }

  int get closed {
    return pullRequests.where((element) => element.state == 'closed').length;
  }
}

extension PullRequestsStateX on PullRequestsState {
  bool get isLoading => status == PullRequestsStatus.loading;
  bool get isEmptyList => pullRequests.isEmpty;
  bool get isSuccess => status == PullRequestsStatus.success;
  bool get isRequestError => status == PullRequestsStatus.requestError;
  bool get isServerError => status == PullRequestsStatus.serverError;
  bool get isUnknownError => status == PullRequestsStatus.unknownError;
  bool get noResultsFound => status == PullRequestsStatus.noResultsFound;
  bool get isError {
    return isRequestError || isServerError || isUnknownError || noResultsFound;
  }

  String get errorMessage {
    if (isRequestError) {
      return Labels().error.requestError;
    } else if (isServerError) {
      return Labels().error.serverError;
    } else if (isUnknownError) {
      return Labels().error.unknownError;
    } else if (noResultsFound) {
      return Labels().error.noResultsFound;
    }
    return '';
  }
}
