import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  final Function(File pickedImage) SetImageFn;
  const ImageInput({super.key, required this.SetImageFn});

  @override
  State<ImageInput> createState() => ImageInputState();
}

class ImageInputState extends State<ImageInput> {
  File? _pickedImage;

  @override
  Widget build(BuildContext context) {
    void _pickImage() async {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(
          source: ImageSource.camera, imageQuality: 50, maxWidth: 150);
      if (pickedImage == null) {
        return;
      }
      final pickedImageFile = File(pickedImage.path);
      setState(() {
        _pickedImage = pickedImageFile;
      });

      widget.SetImageFn(pickedImageFile);
    }

    return Column(
      children: [
        if (_pickedImage != null)
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.transparent,
            backgroundImage:
                _pickedImage != null ? FileImage(_pickedImage!) : null,
          ),
        TextButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.image),
          label: const Text('Add Image'),
        ),
      ],
    );
  }
}
