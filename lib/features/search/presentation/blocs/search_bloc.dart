import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos/core/error/src.dart';
import 'package:github_repos/core/extensions/src.dart';
import 'package:github_repos/features/search/domain/exceptions/search_exceptions.dart';
import 'package:github_repos/features/search/domain/src.dart';
import 'package:github_repos/features/search/presentation/blocs/search_event.dart';
import 'package:github_repos/features/search/presentation/blocs/search_state.dart';
import 'package:injectable/injectable.dart';

@Injectable()
final class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.getGitHubReposByName) : super(SearchState()) {
    on<GetInitialReposByName>(_onGetInitialReposByName);
    on<GetMoreRepos>(_onGetMoreRepos);
  }

  final GetGitHubReposByName getGitHubReposByName;

  FutureOr<void> _onGetInitialReposByName(
    GetInitialReposByName event,
    Emitter<SearchState> emit,
  ) async {
    try {
      if (state.isLoading) {
        return;
      }
      emit(
        state.copyWith(
          status: SearchStatus.loading,
          search: event.name,
          page: 1,
        ),
      );
      final repos = await getGitHubReposByName(event.name, state.page);
      emit(
        state.copyWith(
          status: SearchStatus.success,
          repos: repos,
          page: state.page.increment(),
        ),
      );
    } on NoResultsFound {
      emit(state.copyWith(status: SearchStatus.noResultsFound));
    } on RequestError {
      emit(state.copyWith(status: SearchStatus.requestError));
    } on ServerError {
      emit(state.copyWith(status: SearchStatus.serverError));
    } on UnknownError {
      emit(state.copyWith(status: SearchStatus.unknownError));
    }
  }

  FutureOr<void> _onGetMoreRepos(
    GetMoreRepos event,
    Emitter<SearchState> emit,
  ) async {
    try {
      if (state.isLoading || state.noResultsFound) {
        return;
      }
      emit(state.copyWith(status: SearchStatus.loading));
      final repos = await getGitHubReposByName(state.search, state.page);
      emit(
        state.copyWith(
          status: SearchStatus.success,
          repos: repos,
          page: state.page.increment(),
        ),
      );
    } on NoResultsFound {
      emit(state.copyWith(status: SearchStatus.noResultsFound));
    } on RequestError {
      emit(state.copyWith(status: SearchStatus.requestError));
    } on ServerError {
      emit(state.copyWith(status: SearchStatus.serverError));
    } on UnknownError {
      emit(state.copyWith(status: SearchStatus.unknownError));
    }
  }
}
