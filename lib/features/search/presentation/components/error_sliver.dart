import 'package:flutter/material.dart';

class ErrorSliver extends StatelessWidget {
  final bool isVisible;
  final String message;

  const ErrorSliver({Key? key, required this.isVisible, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Visibility(
        visible: isVisible,
        child: Center(child: Text(message)),
      ),
    );
  }
}
