import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  final parts = [
    'Resistor',
    'Capacitor',
    'Diode',
    'Thermistor',
    'LED',
    'Transistor',
    'Photo-resistor',
    'Integrated Circuits',
    'Potentiometer',
    'Switch',
    'CRO'
  ];

  final recentParts = [
    'Diode',
    'Thermistor',
    'LED',
    'Transistor',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty
        ? recentParts
        : parts.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                children: [
                  TextSpan(
                    text: suggestionList[index].substring(query.length),
                      style:TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                  )
                ]),
          ),
        );
      },
      itemCount: suggestionList.length,
    );
  }
}
