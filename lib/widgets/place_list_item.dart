import 'package:flutter/material.dart';

import '../models/place.dart';

class PlaceListItem extends StatelessWidget {

  final Place place;

  const PlaceListItem(this.place);

  void goToDetailPage() {

  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: FileImage(place.image)),
      title: Text(place.title),
      onTap: goToDetailPage,
    );
  }

}