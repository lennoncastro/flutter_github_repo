import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos/core/error/src.dart';
import 'package:github_repos/features/search/domain/src.dart';
import 'package:github_repos/features/search/presentation/blocs/search_event.dart';
import 'package:github_repos/features/search/presentation/blocs/search_state.dart';
import 'package:injectable/injectable.dart';

@Injectable()
final class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(final GetGitHubReposByName getGitHubReposByName)
      : super(SearchState()) {
    on<GetReposByName>((
      GetReposByName event,
      Emitter<SearchState> emit,
    ) async {
      try {
        emit(state.copyWith(status: SearchStatus.loading));
        final repos = await getGitHubReposByName(event.name);
        emit(state.copyWith(status: SearchStatus.success, repos: repos));
      } on RequestError {
        emit(state.copyWith(status: SearchStatus.requestError));
      } on ServerError {
        emit(state.copyWith(status: SearchStatus.serverError));
      } on UnknownError {
        emit(state.copyWith(status: SearchStatus.unknownError));
      }
    });
  }
}
