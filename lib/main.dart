import 'package:flutter/material.dart';
import 'package:practice_application_2/screen/cached_image_grid.dart';
import 'package:practice_application_2/screen/image_grid.dart';
import 'package:practice_application_2/screen/photo_gallery.dart';
import './screen/image_picker.dart'; 
main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CachedImageGrid(),
    );
  }
}


