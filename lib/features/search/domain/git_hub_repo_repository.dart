import 'package:github_repos/features/search/data/models/git_hub_repo_model.dart';

abstract interface class GitHubRepoRepository {
  Future<List<GitHubRepo>> getRepositories({
    required String query,
    required int page,
    required String sort,
  });
}
