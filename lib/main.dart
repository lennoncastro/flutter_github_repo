import 'package:flutter/material.dart';
import 'package:github_repos/app.dart';
import 'package:github_repos/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const App());
}
