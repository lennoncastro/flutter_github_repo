import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

Future<T> loadJson<T>(String path) async {
  return jsonDecode(await rootBundle.loadString(path)) as T;
}
