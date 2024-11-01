import 'package:flutter_test/flutter_test.dart';
import 'package:github_repos/app.dart';
import 'package:github_repos/core/error/src.dart';
import 'package:github_repos/core/utils/src.dart';
import 'package:github_repos/features/search/data/src.dart';
import 'package:github_repos/features/search/presentation/pages/src.dart';
import 'package:github_repos/injection.dart';
import 'package:mocktail/mocktail.dart';

class GitHubRepoRestServiceMock extends Mock implements GitHubRepoRestService {}

void main() {
  final _service = GitHubRepoRestServiceMock();

  setUpAll(() {
    configureDependencies(isUnitTest: true);
    getIt.registerLazySingleton<GitHubRepoRestService>(() => _service);
  });

  tearDown(() {
    reset(_service);
  });

  testWidgets('Should initialize correctly', (WidgetTester tester) async {
    // arrange
    when(() => _service.getRepositories(any())).thenAnswer((_) async {
      final json = await loadJson('mocks/get_repos_with_success.json');
      return GitHubRepoResponse.fromJson(json);
    });
    await tester.pumpWidget(App());
    await tester.pump();

    // assert
    expect(find.byType(SearchPage), findsOneWidget);
    expect(find.text('mall'), findsOneWidget);
  });

  testWidgets('Should display request error', (WidgetTester tester) async {
    // arrange
    when(() => _service.getRepositories(any())).thenThrow(RequestError());
    await tester.pumpWidget(App());
    await tester.pump();

    // assert
    expect(find.byType(SearchPage), findsOneWidget);
    expect(find.text('Request Error'), findsOneWidget);
  });

  testWidgets('Should display server error', (WidgetTester tester) async {
    // arrange
    when(() => _service.getRepositories(any())).thenThrow(ServerError());
    await tester.pumpWidget(App());
    await tester.pump();

    // assert
    expect(find.byType(SearchPage), findsOneWidget);
    expect(find.text('Server Error'), findsOneWidget);
  });

  testWidgets('Should display unknown error', (WidgetTester tester) async {
    // arrange
    when(() => _service.getRepositories(any())).thenThrow(UnknownError());
    await tester.pumpWidget(App());
    await tester.pump();

    // assert
    expect(find.byType(SearchPage), findsOneWidget);
    expect(find.text('Unknown Error'), findsOneWidget);
  });
}
