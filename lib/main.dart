import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/great_places.dart';

import './pages/places_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final ThemeData theme = ThemeData(
    primarySwatch: Colors.indigo,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber)
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great places',
        theme: theme,
        home: PlacesListPage()
      )
    );
  }
}