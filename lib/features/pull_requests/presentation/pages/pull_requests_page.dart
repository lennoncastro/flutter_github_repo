import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos/core/components/src.dart';
import 'package:github_repos/features/pull_requests/presentation/blocs/src.dart';
import 'package:github_repos/features/pull_requests/presentation/components/src.dart';

final class PullRequestsPage extends StatefulWidget {
  const PullRequestsPage({
    super.key,
    required this.user,
    required this.repo,
  });

  final String user;

  final String repo;

  @override
  State<PullRequestsPage> createState() => _PullRequestsPageState();
}

class _PullRequestsPageState extends State<PullRequestsPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final getByUserAndRepo = GetByUserAndRepo(
      user: widget.user,
      repo: widget.repo,
    );
    context.read<PullRequestsBloc>().add(getByUserAndRepo);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              PullRequestAppBar(repo: widget.repo),
              BlocBuilder<PullRequestsBloc, PullRequestsState>(buildWhen:
                  (PullRequestsState previous, PullRequestsState current) {
                return previous.isSuccess != current.isSuccess;
              }, builder: (
                BuildContext context,
                PullRequestsState state,
              ) {
                return PullRequestInfo(open: state.open, closed: state.closed);
              }),
              BlocBuilder<PullRequestsBloc, PullRequestsState>(
                builder: (
                  BuildContext context,
                  PullRequestsState state,
                ) {
                  return PullRequestList(state.pullRequests);
                },
              ),
            ],
          ),
        ),
        BlocBuilder<PullRequestsBloc, PullRequestsState>(
          buildWhen: (PullRequestsState previous, PullRequestsState current) {
            return previous.isLoading != current.isLoading;
          },
          builder: (BuildContext context, PullRequestsState state) {
            return Visibility(
              visible: state.isLoading,
              child: BackgroundOverlay(),
            );
          },
        ),
      ],
    );
  }
}