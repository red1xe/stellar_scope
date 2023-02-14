// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:stellar_scope/pages/planets_info_page.dart';

import '../main.dart';

class SearchPlanet extends SearchDelegate {
  final List<String> planetnames;
  final List<String> planetids;
  SearchPlanet(
    this.planetnames,
    this.planetids,
  );
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> allresults = planetnames
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(allresults[index]),
      ),
      itemCount: allresults.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestionList = planetnames
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();
    final List<String> ids = planetids
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemBuilder: (context, index) => Column(
        children: [
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, InfoPage.routeName,
                    arguments: Arguments(
                        ids[index],
                        "https://cdn-icons-png.flaticon.com/512/40/40381.png",
                        Theme.of(context).colorScheme.background));
              },
              title: Text(suggestionList[index],
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ],
      ),
      itemCount: suggestionList.length,
    );
  }
}
