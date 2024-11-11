import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos/core/error/src.dart';
import 'package:github_repos/core/extensions/src.dart';
import 'package:github_repos/core/state/src.dart';
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
          status: Status.loading,
          search: event.name,
          page: 1,
        ),
      );
      final query = 'language:${event.name}';
      final repos = await getGitHubReposByName(
        query: query,
        page: state.page,
        sort: 'stars',
      );
      emit(
        state.copyWith(
          status: Status.success,
          repos: repos,
          page: state.page.increment(),
        ),
      );
    } on Exception catch (e) {
      _handleError(e, emit);
    } catch (_) {
      emit(state.copyWith(status: Status.unknownError));
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
      emit(state.copyWith(status: Status.loading));
      final query = 'language:${state.search}';
      final repos = await getGitHubReposByName(
        query: query,
        page: state.page,
        sort: 'stars',
      );
      emit(
        state.copyWith(
          status: Status.success,
          repos: [...state.repos, ...repos],
          page: state.page.increment(),
        ),
      );
    } on Exception catch (e) {
      _handleError(e, emit);
    } catch (_) {
      emit(state.copyWith(status: Status.unknownError));
    }
  }

  void _handleError(Exception e, Emitter<SearchState> emit) {
    if (e is NoResultsFound) {
      emit(state.copyWith(status: Status.noResultsFound));
    } else if (e is RequestError) {
      emit(state.copyWith(status: Status.requestError));
    } else if (e is ServerError) {
      emit(state.copyWith(status: Status.serverError));
    } else if (e is NoInternetException) {
      emit(state.copyWith(status: Status.noInternetConnection));
    } else {
      emit(state.copyWith(status: Status.unknownError));
    }
  }
}
