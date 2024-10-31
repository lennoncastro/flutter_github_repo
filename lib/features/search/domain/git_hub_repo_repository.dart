import 'package:github_repos/features/search/data/models/git_hub_repo_model.dart';

abstract interface class GitHubRepoRepository {
  Future<List<GitHubRepo>> getRepositories(String name);
}
