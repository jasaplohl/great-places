import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemCount {
    return _items.length;
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
  }
}