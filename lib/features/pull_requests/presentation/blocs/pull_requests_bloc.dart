import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos/core/error/src.dart';
import 'package:github_repos/core/state/src.dart';
import 'package:github_repos/features/pull_requests/domain/src.dart';
import 'package:github_repos/features/pull_requests/presentation/blocs/pull_requests_event.dart';
import 'package:github_repos/features/pull_requests/presentation/blocs/pull_requests_state.dart';
import 'package:github_repos/features/search/domain/exceptions/search_exceptions.dart';
import 'package:injectable/injectable.dart';

@Injectable()
final class PullRequestsBloc
    extends Bloc<PullRequestsEvent, PullRequestsState> {
  PullRequestsBloc({
    required this.getPullRequestsByRepoAndAuthor,
  }) : super(PullRequestsState()) {
    on<GetByUserAndRepo>(_onGetByUserAndRepo);
  }

  final GetPullRequestsByUserAndRepo getPullRequestsByRepoAndAuthor;

  FutureOr<void> _onGetByUserAndRepo(
    GetByUserAndRepo event,
    Emitter<PullRequestsState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final pullRequests = await getPullRequestsByRepoAndAuthor(
        user: event.user,
        repo: event.repo,
      );
      emit(
        state.copyWith(
          status: Status.success,
          pullRequests: pullRequests,
        ),
      );
    } on Exception catch (e) {
      _handleError(e, emit);
    } catch (_) {
      emit(state.copyWith(status: Status.unknownError));
    }
  }

  void _handleError(Exception e, Emitter<PullRequestsState> emit) {
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
