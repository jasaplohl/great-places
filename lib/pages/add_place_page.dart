import 'package:flutter/material.dart';

import '../widgets/image_input.dart';

class AddPlacePage extends StatefulWidget {
  static const String routeName = "/add-place";

  @override
  _AddPlacePageState createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {

  final TextEditingController _titleController = TextEditingController();

  void submitPlace() {

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
                    ImageInput()
                  ],
                )
              )
            )
          ),
          ElevatedButton.icon(
            onPressed: submitPlace, 
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