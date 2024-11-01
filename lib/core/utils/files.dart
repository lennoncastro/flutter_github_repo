import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

Future<Map<String, dynamic>> loadJson(String path) async {
  return jsonDecode(await rootBundle.loadString(path)) as Map<String, dynamic>;
}
