import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchScreen extends HookConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screen = Scaffold(
      appBar: AppBar(
        title: SearchAnchor(
            builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                controller: controller,
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0)),
                onTap: () {
                  controller.openView();
                },
                onChanged: (text) {

                },
                onSubmitted: (text) {

                },
                leading: const Icon(Icons.search),
              );
            },
            suggestionsBuilder: (BuildContext context,
                SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {

                  },
                );
              });
            }),
      ),
    );

    return Stack(children: [screen]);
  }

}
