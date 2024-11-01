import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_repos/features/search/data/src.dart';

part 'search_state.freezed.dart';

enum SearchStatus {
  initial,
  loading,
  success,
  requestError,
  serverError,
  unknownError
}

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(SearchStatus.initial) SearchStatus status,
    @Default(<GitHubRepo>[]) List<GitHubRepo> repos,
  }) = _SearchState;
}

extension SearchStateX on SearchState {
  bool get isLoading => status == SearchStatus.loading;
  bool get isEmptyList => repos.isEmpty;
  bool get isSuccess => status == SearchStatus.success;
  bool get isRequestError => status == SearchStatus.requestError;
  bool get isServerError => status == SearchStatus.serverError;
  bool get isUnknownError => status == SearchStatus.unknownError;
}
