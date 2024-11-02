import 'package:github_repos/core/error/src.dart';
import 'package:github_repos/features/search/data/models/git_hub_repo_model.dart';
import 'package:github_repos/features/search/domain/exceptions/search_exceptions.dart';
import 'package:github_repos/features/search/domain/git_hub_repo_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
final class GetGitHubReposByName {
  GetGitHubReposByName(this._gitHubRepoRepository);

  final GitHubRepoRepository _gitHubRepoRepository;

  final List<int> _emptyResultStatusCodes = <int>[404, 422];

  Future<List<GitHubRepo>> call(String name, int page) async {
    try {
      return await _gitHubRepoRepository.getRepositories(name, page);
    } on RequestError catch (error) {
      if (_emptyResultStatusCodes.contains(error.statusCode)) {
        throw NoResultsFound();
      }
      rethrow;
    } catch (_) {
      rethrow;
    }
  }
}
