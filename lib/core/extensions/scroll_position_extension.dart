import 'package:flutter/widgets.dart';

extension ScrollPositionX on ScrollPosition {
  bool get isScrollingDown {
    return pixels >= maxScrollExtent;
  }
}
