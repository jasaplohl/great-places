import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../models/place.dart';
import '../helpers/db_helper.dart';

class GreatPlaces with ChangeNotifier {

  static const String placesTableName = "user_places";
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemCount {
    return _items.length;
  }

  Future<void> fetchAndSetPlaces() async {
    final data = await DBHelper.getData(placesTableName);
    _items = data.map((item) {
      return Place(
        id: item["id"], 
        title: item["title"], 
        location: PlaceLocation(latitude: 0, longitude: 0), 
        image: File(item["image"])
      );
    }).toList();
    notifyListeners();
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: const Uuid().v4(),
      image: image,
      title: title, 
      location: PlaceLocation(
        latitude: 0,
        longitude: 0
      )
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert(placesTableName, {
      "id": newPlace.id,
      "title": newPlace.title,
      "image": newPlace.image.path
    });
  }
}