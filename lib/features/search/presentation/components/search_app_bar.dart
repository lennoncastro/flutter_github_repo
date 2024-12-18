import 'package:flutter/material.dart';
import 'package:github_repos/core/extensions/src.dart';
import 'package:github_repos/core/theme/src.dart';

class SearchAppBar extends StatelessWidget {
  SearchAppBar({required this.onEditingComplete, Key? key}) : super(key: key);

  final double _expandedHeight = 128.0;

  final TextEditingController searchController = TextEditingController();

  final Function(String) onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: _expandedHeight,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsetsDirectional.only(
          bottom: Dimensions.md,
        ),
        title: Container(
          padding: const EdgeInsets.all(Dimensions.sm),
          child: TextField(
            key: Key('search_text_field'),
            controller: searchController,
            onEditingComplete: () {
              FocusScope.of(context).unfocus();
              onEditingComplete(searchController.text);
            },
            decoration: InputDecoration(
              hintText: label.textField.search,
              filled: true,
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
