import 'package:get_it/get_it.dart';
import 'package:github_repos/injection.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies({bool isUnitTest = false}) {
  getIt.init();
  getIt.allowReassignment = isUnitTest;
}
