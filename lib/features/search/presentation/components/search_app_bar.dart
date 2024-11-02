import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget {
  SearchAppBar({required this.onEditingComplete, Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();

  final Function(String) onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 128.0,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsetsDirectional.only(start: 16, bottom: 16),
        title: Container(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            key: Key('search_text_field'),
            controller: searchController,
            onEditingComplete: () {
              onEditingComplete(searchController.text);
            },
            decoration: InputDecoration(
              hintText: 'Search...',
              filled: true,
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
