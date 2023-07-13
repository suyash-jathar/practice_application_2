// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


// Image picker method to pick single image from gallery or camera
pickSingleImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);
  if (_file != null) {
    return await _file.readAsBytes();
  }
  print('No Image Selected');
}

// Image picker method to pick multiple images from gallery or camera
pickMultiImages(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  List<XFile>? _file = await _imagePicker.pickMultiImage();
  if (_file != null) {
    return await _file[0].readAsBytes();
  }
  print('No Image Selected');
}

// for displaying snackbars
showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}