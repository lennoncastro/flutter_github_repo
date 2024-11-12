import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension NavigationX on BuildContext {
  void goRouteNamed(
    String name, {
    Map<String, dynamic> pathParameters = const {},
  }) {
    go(
      namedLocation(
        name,
        pathParameters: pathParameters as Map<String, String>,
      ),
    );
  }
}
