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
      final query = 'language:${event.name}';
      final repos = await getGitHubReposByName(
        query: query,
        page: state.page,
        sort: 'stars',
      );
      emit(
        state.copyWith(
          status: SearchStatus.success,
          repos: [...state.repos, ...repos],
          page: state.page.increment(),
        ),
      );
    } on Exception catch (e) {
      _handleError(e, emit);
    } catch (_) {
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
      final query = 'language:${state.search}';
      final repos = await getGitHubReposByName(
        query: query,
        page: state.page,
        sort: 'stars',
      );
      emit(
        state.copyWith(
          status: SearchStatus.success,
          repos: [...state.repos, ...repos],
          page: state.page.increment(),
        ),
      );
    } on Exception catch (e) {
      _handleError(e, emit);
    } catch (_) {
      emit(state.copyWith(status: SearchStatus.unknownError));
    }
  }

  void _handleError(Exception e, Emitter<SearchState> emit) {
    if (e is NoResultsFound) {
      emit(state.copyWith(status: SearchStatus.noResultsFound));
    } else if (e is RequestError) {
      emit(state.copyWith(status: SearchStatus.requestError));
    } else if (e is ServerError) {
      emit(state.copyWith(status: SearchStatus.serverError));
    } else {
      emit(state.copyWith(status: SearchStatus.unknownError));
    }
  }
}
