import 'dart:io';

import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {

  @override
  _ImageInputState createState() => _ImageInputState();

}

class _ImageInputState extends State<ImageInput> {

  File? _storedImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 100,
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey)
          ),
          child: _storedImage == null
            ? const Text("No Image")
            : Image.file(
                _storedImage!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
        ),
        Expanded(
          child: TextButton(
            onPressed: (){}, 
            child: const Text("Take Image")
          )
        )
      ],
    );
  }

}