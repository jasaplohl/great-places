import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/great_places.dart';

import '../widgets/place_list_item.dart';

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
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).fetchAndSetPlaces(),
        builder: (ctx, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator()
            );
          } else {
            return Consumer<GreatPlaces>(
              builder: (context, greatPlaces, child) {
                if(greatPlaces.itemCount > 0) {
                  return ListView.builder(
                    itemCount: greatPlaces.itemCount,
                    itemBuilder: (context, index) {
                      return PlaceListItem(greatPlaces.items[index]);
                    }
                  );
                } else {
                  return child!;
                }
              },
              child: const Center(
                child: Text("No places yet, start adding some!"),
              ),
            );
          }
        }
      )
    );
  }

}