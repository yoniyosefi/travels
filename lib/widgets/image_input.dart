import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPickImage});

  final void Function(File image) onPickImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _takedPhoto;

  void _takeImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo =
        await picker.pickImage(source: ImageSource.camera, maxWidth: 600);
    if (photo != null) {
      setState(() {
        _takedPhoto = File(photo.path);
      });
      widget.onPickImage(_takedPhoto!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        width: 1,
        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
      )),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: _takedPhoto == null
          ? TextButton.icon(
              onPressed: _takeImage,
              icon: const Icon(Icons.camera),
              label: const Text('Take Picture'),
            )
          : InkWell(
              onTap: _takeImage,
              child: Image.file(
                _takedPhoto!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
    );
  }
}
