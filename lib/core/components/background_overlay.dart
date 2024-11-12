import 'package:flutter/material.dart';
import 'package:github_repos/core/extensions/src.dart';

class BackgroundOverlay extends StatelessWidget {
  const BackgroundOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.halfOpacity,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
