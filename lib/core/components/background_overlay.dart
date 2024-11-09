import 'package:flutter/material.dart';

class BackgroundOverlay extends StatelessWidget {
  const BackgroundOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
