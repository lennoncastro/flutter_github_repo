import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repos/app.dart';
import 'package:github_repos/core/error/src.dart';
import 'package:github_repos/core/utils/src.dart';
import 'package:github_repos/features/pull_requests/data/src.dart';
import 'package:github_repos/features/pull_requests/presentation/pages/src.dart';
import 'package:github_repos/injection.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

void main() {
  final _service = PullRequestsServiceMock();

  setUpAll(() {
    configureDependencies(isUnitTest: true);
    getIt.registerLazySingleton<PullRequestsService>(() => _service);
  });

  tearDown(() {
    reset(_service);
  });

  testWidgets('Should initialize correctly', (WidgetTester tester) async {
    // arrange
    when(() => _service.getPullRequestsByUserAndRepo(
          user: any(named: 'user'),
          repo: any(named: 'repo'),
        )).thenAnswer((_) async {
      final json = await loadJson<List<dynamic>>(
          'mocks/get_pull_requests_by_user_and_repo.json');
      return json
          .map((dynamic i) => PullRequest.fromJson(i as Map<String, dynamic>))
          .toList();
    });
    await tester.pumpWidget(
      App(
        initialLocation: '/pull-requests/torvalds/linux',
      ),
    );
    await tester.pump();

    // assert
    expect(find.byType(PullRequestsPage), findsOneWidget);
    expect(find.text('Update acp6x-mach.c'), findsOneWidget);
    expect(find.text('added dmic quirk for Xiaomi Redmi G Pro 2022 laptop'), findsOneWidget);
    expect(find.text('anf1980'), findsOneWidget);
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
    when(() => _service.getPullRequestsByUserAndRepo(
          user: any(named: 'user'),
          repo: any(named: 'repo'),
        )).thenThrow(dioException);
    await tester.pumpWidget(
      App(
        initialLocation: '/pull-requests/torvalds/linux',
      ),
    );
    await tester.pump();

    // assert
    expect(find.byType(PullRequestsPage), findsOneWidget);
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
    when(() => _service.getPullRequestsByUserAndRepo(
          user: any(named: 'user'),
          repo: any(named: 'repo'),
        )).thenThrow(dioException);
    await tester.pumpWidget(
      App(
        initialLocation: '/pull-requests/torvalds/linux',
      ),
    );
    await tester.pump();

    // assert
    expect(find.byType(PullRequestsPage), findsOneWidget);
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
    when(() => _service.getPullRequestsByUserAndRepo(
          user: any(named: 'user'),
          repo: any(named: 'repo'),
        )).thenThrow(dioException);
    await tester.pumpWidget(
      App(
        initialLocation: '/pull-requests/torvalds/linux',
      ),
    );
    await tester.pump();

    // assert
    expect(find.byType(PullRequestsPage), findsOneWidget);
    expect(find.text('Erro desconhecido'), findsOneWidget);
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
    when(() => _service.getPullRequestsByUserAndRepo(
          user: any(named: 'user'),
          repo: any(named: 'repo'),
        )).thenThrow(dioException);
    await tester.pumpWidget(
      App(
        initialLocation: '/pull-requests/torvalds/linux',
      ),
    );
    await tester.pump();

    // assert
    expect(find.byType(PullRequestsPage), findsOneWidget);
    expect(find.text('Sem conexão a internet'), findsOneWidget);
  });
}
