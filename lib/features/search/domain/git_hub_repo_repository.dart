import 'package:github_repos/features/search/data/models/git_hub_repo_model.dart';

abstract class GitHubRepoRepository {
  Future<List<GitHubRepo>> getRepositories();
}
