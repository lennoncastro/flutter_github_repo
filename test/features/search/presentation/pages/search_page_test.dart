import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repos/app.dart';
import 'package:github_repos/core/error/src.dart';
import 'package:github_repos/core/utils/src.dart';
import 'package:github_repos/features/search/data/src.dart';
import 'package:github_repos/features/search/presentation/pages/src.dart';
import 'package:github_repos/injection.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

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
    when(() => _service.getRepositories(
          query: any(named: 'query'),
          page: any(named: 'page'),
          sort: any(named: 'sort'),
        )).thenAnswer((_) async {
      final json = await loadJson<Map<String, dynamic>>('mocks/get_repos_with_success.json');
      return GitHubRepoResponse.fromJson(json);
    });
    await tester.pumpWidget(App(initialLocation: '/'));
    await tester.pump();

    // act
    await tester.enterText(find.byKey(const Key('search_text_field')), 'java');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    // assert
    expect(find.byType(SearchPage), findsOneWidget);
    expect(find.text('mall'), findsOneWidget);
  });

  testWidgets('Should display request error', (WidgetTester tester) async {
    // arrange
    final response = Response(
      requestOptions: requestOptions,
      statusCode: 400,
    );
    final dioException = DioException(
      response: response,
      requestOptions: requestOptions,
      type: DioExceptionType.badResponse,
    );
    when(() => _service.getRepositories(
          query: any(named: 'query'),
          page: any(named: 'page'),
          sort: any(named: 'sort'),
        )).thenThrow(dioException);
    await tester.pumpWidget(App(initialLocation: '/'));
    await tester.pump();

    // act
    await tester.enterText(find.byKey(const Key('search_text_field')), 'java');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    // assert
    expect(find.byType(SearchPage), findsOneWidget);
    expect(find.text('Erro de requisição'), findsOneWidget);
  });

  testWidgets('Should display server error', (WidgetTester tester) async {
    // arrange
    final response = Response(
      requestOptions: requestOptions,
      statusCode: 501,
    );
    final dioException = DioException(
      response: response,
      requestOptions: requestOptions,
      type: DioExceptionType.badResponse,
    );
    when(() => _service.getRepositories(
          query: any(named: 'query'),
          page: any(named: 'page'),
          sort: any(named: 'sort'),
        )).thenThrow(dioException);
    await tester.pumpWidget(App(initialLocation: '/'));
    await tester.pump();

    // act
    await tester.enterText(find.byKey(const Key('search_text_field')), 'java');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    // assert
    expect(find.byType(SearchPage), findsOneWidget);
    expect(find.text('Erro do servidor'), findsOneWidget);
  });

  testWidgets('Should display unknown error', (WidgetTester tester) async {
    // arrange
    final response = Response(
      requestOptions: requestOptions,
      statusCode: 400,
    );
    final dioException = DioException(
      response: response,
      requestOptions: requestOptions,
      type: DioExceptionType.unknown,
    );
    when(() => _service.getRepositories(
          query: any(named: 'query'),
          page: any(named: 'page'),
          sort: any(named: 'sort'),
        )).thenThrow(dioException);
    await tester.pumpWidget(App(initialLocation: '/'));
    await tester.pump();

    // act
    await tester.enterText(find.byKey(const Key('search_text_field')), 'java');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    // assert
    expect(find.byType(SearchPage), findsOneWidget);
    expect(find.text('Erro desconhecido'), findsOneWidget);
  });

  testWidgets('Should display no results found error',
      (WidgetTester tester) async {
    // arrange
    final response = Response(
      requestOptions: requestOptions,
      statusCode: 422,
    );
    final dioException = DioException(
      response: response,
      requestOptions: requestOptions,
      type: DioExceptionType.badResponse,
    );
    when(() => _service.getRepositories(
          query: any(named: 'query'),
          page: any(named: 'page'),
          sort: any(named: 'sort'),
        )).thenThrow(dioException);
    await tester.pumpWidget(App(initialLocation: '/'));
    await tester.pump();

    // act
    await tester.enterText(find.byKey(const Key('search_text_field')), 'java');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    // assert
    expect(find.byType(SearchPage), findsOneWidget);
    expect(find.text('Nenhum resultado encontrado'), findsOneWidget);
  });

  testWidgets('Should display no internet connection error',
      (WidgetTester tester) async {
    // arrange
    final response = Response(requestOptions: requestOptions);
    final dioException = DioException(
      response: response,
      requestOptions: requestOptions,
      type: DioExceptionType.badResponse,
      error: NoInternetException(),
    );
    when(() => _service.getRepositories(
          query: any(named: 'query'),
          page: any(named: 'page'),
          sort: any(named: 'sort'),
        )).thenThrow(dioException);
    await tester.pumpWidget(App(initialLocation: '/'));
    await tester.pump();

    // act
    await tester.enterText(find.byKey(const Key('search_text_field')), 'java');
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    // assert
    expect(find.byType(SearchPage), findsOneWidget);
    expect(find.text('Sem conexão a internet'), findsOneWidget);
  });
}
