import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos/core/state/status_enum.dart';
import 'package:github_repos/features/pull_requests/domain/src.dart';
import 'package:github_repos/features/pull_requests/presentation/blocs/pull_requests_event.dart';
import 'package:github_repos/features/pull_requests/presentation/blocs/pull_requests_state.dart';
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
    } catch (_) {
      emit(state.copyWith(status: Status.unknownError));
    }
  }
}
