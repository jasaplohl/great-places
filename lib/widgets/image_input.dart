import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {

  @override
  _ImageInputState createState() => _ImageInputState();

}

class _ImageInputState extends State<ImageInput> {

  File? _storedImage;

  void _openCamera() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker
      .pickImage(source: ImageSource.camera);
    if(pickedImage != null) {
      setState(() {
        _storedImage = File(pickedImage.path);
      });
      final appDir = await syspaths.getApplicationDocumentsDirectory();
      final String fileName = path.basename(_storedImage!.path);

      final File savedImage = await _storedImage!.copy("${appDir.path}/$fileName");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 150,
          height: 150,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey)
          ),
          child: _storedImage == null
            ? const Text("No Image Taken", textAlign: TextAlign.center)
            : Image.file(
                _storedImage!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
        ),
        Expanded(
          child: TextButton.icon(
            icon: const Icon(Icons.camera),
            label: const Text("Take Picture"),
            style: TextButton.styleFrom(
              primary: Theme.of(context).primaryColor
            ),
            onPressed: _openCamera
          )
        )
      ],
    );
  }

}