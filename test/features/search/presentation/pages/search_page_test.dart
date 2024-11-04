import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repos/app.dart';
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
    when(() => _service.getRepositories(any(), any())).thenAnswer((_) async {
      final json = await loadJson('mocks/get_repos_with_success.json');
      return GitHubRepoResponse.fromJson(json);
    });
    await tester.pumpWidget(App());
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
      statusMessage: 'Request cancelled',
    );
    final dioException = DioException(
      response: response,
      requestOptions: requestOptions,
      type: DioExceptionType.badResponse,
      error: 'Request cancelled',
    );
    when(() => _service.getRepositories(any(), any())).thenThrow(dioException);
    await tester.pumpWidget(App());
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
      statusMessage: 'Server error',
    );
    final dioException = DioException(
      response: response,
      requestOptions: requestOptions,
      type: DioExceptionType.badResponse,
      error: 'Server error',
    );
    when(() => _service.getRepositories(any(), any())).thenThrow(dioException);
    await tester.pumpWidget(App());
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
      statusMessage: 'Unknown error',
    );
    final dioException = DioException(
      response: response,
      requestOptions: requestOptions,
      type: DioExceptionType.unknown,
      error: 'Unknown error',
    );
    when(() => _service.getRepositories(any(), any())).thenThrow(dioException);
    await tester.pumpWidget(App());
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
      statusMessage: 'Request cancelled',
    );
    final dioException = DioException(
      response: response,
      requestOptions: requestOptions,
      type: DioExceptionType.badResponse,
      error: 'Request cancelled',
    );
    when(() => _service.getRepositories(any(), any())).thenThrow(dioException);
    await tester.pumpWidget(App());
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
}
