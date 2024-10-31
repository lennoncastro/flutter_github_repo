import 'package:github_repos/features/search/data/models/git_hub_repo_model.dart';
import 'package:github_repos/features/search/domain/git_hub_repo_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
final class GetGitHubReposByName {
  GetGitHubReposByName(this._gitHubRepoRepository);

  final GitHubRepoRepository _gitHubRepoRepository;

  Future<List<GitHubRepo>> call(String name) async {
    return _gitHubRepoRepository.getRepositories(name);
  }
}
