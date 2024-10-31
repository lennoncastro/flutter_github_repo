import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_repos/features/search/data/git_hub_repo_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dio = Dio();
  dio.options.headers['Demo-Header'] =
      'demo header'; // config your dio headers globally
  final client = GitHubRepoRestService(dio);
  client.getRepositories().then(print);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Git Hub Repos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Text('Git Hub Repos'),
    );
  }
}
