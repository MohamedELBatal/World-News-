import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate {
  List<String> fruitList = [
    'Apple',
    'Banana',
    'Peach',
    'Avocado',
    'Orange',
    'Pear',
    'Watermelon',
    'pineapple',
  ];

  // Adapt buildSuggestions to avoid duplicate logic
  @override
  Widget buildSuggestions(BuildContext context) {
    // Leverage the filtering logic from buildResults
    return buildResults(context);
  }

  // No changes needed in buildActions and buildLeading methods

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];

    for (var fruit in fruitList) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchQuery[index]),
        );
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }
}
