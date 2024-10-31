// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/network/network_module.dart' as _i550;
import 'features/search/data/git_hub_repo_repository.dart' as _i780;
import 'features/search/data/git_hub_repo_service.dart' as _i594;
import 'features/search/domain/git_hub_repo_repository.dart' as _i200;
import 'features/search/domain/src.dart' as _i230;
import 'features/search/domain/usecases/get_git_hub_repos_by_name.dart' as _i90;
import 'features/search/presentation/blocs/search_bloc.dart' as _i807;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.factory<_i594.GitHubRepoRestService>(
        () => _i594.GitHubRepoRestService.create(gh<_i361.Dio>()));
    gh.factory<_i230.GitHubRepoRepository>(() =>
        _i780.GitHubRepoRepositoryImpl(gh<_i594.GitHubRepoRestService>()));
    gh.factory<_i90.GetGitHubReposByName>(
        () => _i90.GetGitHubReposByName(gh<_i200.GitHubRepoRepository>()));
    gh.factory<_i807.SearchBloc>(
        () => _i807.SearchBloc(gh<_i230.GetGitHubReposByName>()));
    return this;
  }
}

class _$NetworkModule extends _i550.NetworkModule {}
