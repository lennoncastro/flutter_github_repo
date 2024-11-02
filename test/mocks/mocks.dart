import 'package:dio/dio.dart';
import 'package:github_repos/features/search/data/src.dart';
import 'package:mocktail/mocktail.dart';

final requestOptions = RequestOptions(path: '/');

class GitHubRepoRestServiceMock extends Mock implements GitHubRepoRestService {}
