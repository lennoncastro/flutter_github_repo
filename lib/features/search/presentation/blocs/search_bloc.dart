import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos/core/error/src.dart';
import 'package:github_repos/features/search/data/src.dart';
import 'package:github_repos/features/search/domain/exceptions/search_exceptions.dart';
import 'package:github_repos/features/search/domain/src.dart';
import 'package:github_repos/features/search/presentation/blocs/search_event.dart';
import 'package:github_repos/features/search/presentation/blocs/search_state.dart';
import 'package:injectable/injectable.dart';

@Injectable()
final class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(final GetGitHubReposByName getGitHubReposByName)
      : super(SearchState()) {
    on<GetInitialReposByName>((
      GetInitialReposByName event,
      Emitter<SearchState> emit,
    ) async {
      try {
        if (state.isLoading) {
          return;
        }
        _page = 1;
        _repos.clear();
        _search = event.name;
        emit(state.copyWith(status: SearchStatus.loading));
        final repos = await getGitHubReposByName(_search, _page);
        _repos.addAll(repos);
        _page++;
        emit(state.copyWith(status: SearchStatus.success, repos: _repos));
      } on NoResultsFound {
        emit(state.copyWith(status: SearchStatus.noResultsFound));
      } on RequestError {
        emit(state.copyWith(status: SearchStatus.requestError));
      } on ServerError {
        emit(state.copyWith(status: SearchStatus.serverError));
      } on UnknownError {
        emit(state.copyWith(status: SearchStatus.unknownError));
      }
    });
    on<GetMoreRepos>((
      GetMoreRepos event,
      Emitter<SearchState> emit,
    ) async {
      try {
        if (state.isLoading || state.noResultsFound) {
          return;
        }
        emit(state.copyWith(status: SearchStatus.loading));
        final repos = await getGitHubReposByName(_search, _page);
        _repos.addAll(repos);
        _page++;
        emit(state.copyWith(status: SearchStatus.success, repos: _repos));
      } on NoResultsFound {
        emit(state.copyWith(status: SearchStatus.noResultsFound));
      } on RequestError {
        emit(state.copyWith(status: SearchStatus.requestError));
      } on ServerError {
        emit(state.copyWith(status: SearchStatus.serverError));
      } on UnknownError {
        emit(state.copyWith(status: SearchStatus.unknownError));
      }
    });
  }

  int _page = 1;

  List<GitHubRepo> _repos = List<GitHubRepo>.empty(growable: true);

  String _search = '';
}
