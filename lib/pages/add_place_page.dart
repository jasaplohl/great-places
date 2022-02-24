import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/image_input.dart';
import '../widgets/location_input.dart';

import '../providers/great_places.dart';

class AddPlacePage extends StatefulWidget {
  static const String routeName = "/add-place";

  @override
  _AddPlacePageState createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {

  final TextEditingController _titleController = TextEditingController();
  File? _pickedImage;

  void _submitPlace(BuildContext context) {
    final String title = _titleController.text;
    if(title.isNotEmpty && _pickedImage != null) {
      Provider.of<GreatPlaces>(context, listen: false).addPlace(title, _pickedImage!);
      Navigator.of(context).pop();
    }
  }

  void _imagePicked(File pickedImage) {
    _pickedImage = pickedImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new place")
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(labelText: "Title"),
                      controller: _titleController
                    ),
                    const SizedBox(height: 15),
                    ImageInput(_imagePicked),
                    const SizedBox(height: 15),
                    LocationInput()
                  ],
                )
              )
            )
          ),
          ElevatedButton.icon(
            onPressed: () => _submitPlace(context), 
            icon: const Icon(Icons.add), 
            label: const Text("Add Place"),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.secondary)
            ),
          )
        ],
      ),
    );
  }
}