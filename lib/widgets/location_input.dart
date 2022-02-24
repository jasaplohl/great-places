import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  final BoxDecoration containerDecoration = BoxDecoration(
    border: Border.all(
      width: 1,
      color: Colors.grey
    )
  );

  Future<void> _getCurrentUserLocation() async {
    final LocationData locationData = await Location().getLocation();
    print(locationData.latitude);
    print(locationData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Preview container
        Container(
          height: 170,
          width: double.infinity,
          decoration: containerDecoration,
          child: _previewImageUrl == null
            ? const Center(
                child: Text(
                  "No location chosen!", 
                  textAlign: TextAlign.center
                )
              )
            : Image.network(
                _previewImageUrl!, 
                fit: BoxFit.cover,
                width: double.infinity,
              )
        ),
        // Location picker
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrentUserLocation, 
              icon: const Icon(Icons.location_on), 
              label: const Text("Current location"),
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  color: Theme.of(context).primaryColor
                )
              ),
            ),
            TextButton.icon(
              onPressed: () {}, 
              icon: const Icon(Icons.map), 
              label: const Text("Choose location"),
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  color: Theme.of(context).primaryColor
                )
              ),
            )
          ],
        )
      ],
    );
  }

}