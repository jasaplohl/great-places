import 'package:flutter/material.dart';

import './add_place_page.dart';

class PlacesListPage extends StatelessWidget {

  void onAddPlaceClick(BuildContext context) {
    Navigator.of(context).pushNamed(AddPlacePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
        actions: [
          IconButton(
            onPressed: () => onAddPlaceClick(context), 
            icon: const Icon(Icons.add)
          )
        ],
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

}