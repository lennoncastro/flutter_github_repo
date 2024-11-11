import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_repos/core/state/src.dart';
import 'package:github_repos/features/search/data/src.dart';
import 'package:github_repos/labels.i69n.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(Status.initial) Status status,
    @Default(1) int page,
    @Default('') String search,
    @Default(<GitHubRepo>[]) List<GitHubRepo> repos,
  }) = _SearchState;
}

extension SearchStateX on SearchState {
  bool get isLoading => status == Status.loading;
  bool get isEmptyList => repos.isEmpty;
  bool get isSuccess => status == Status.success;
  bool get isRequestError => status == Status.requestError;
  bool get isServerError => status == Status.serverError;
  bool get isUnknownError => status == Status.unknownError;
  bool get noResultsFound => status == Status.noResultsFound;
  bool get noInternetConnection => status == Status.noInternetConnection;
  bool get isError {
    final possibleErrors = [
      isRequestError,
      isServerError,
      isUnknownError,
      noResultsFound,
      noInternetConnection,
    ];
    return possibleErrors.any((error) => error);
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
