import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice_application_2/widgets/utils.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
// Image Picker

class ImagePicker extends StatefulWidget {
  const ImagePicker({super.key});

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  bool isLoading=false;
  Uint8List? _image;

  // Image picker method to pick single image from gallery or camera
  void selectSingleImage(ImageSource source)async{
    isLoading=true;
    Uint8List im=await pickSingleImage(source);
    setState(() {
      _image=im;
    });
    isLoading=false;
    showSnackBar(context, 'Image is Loaded');
  }
  
  // Method to save the imported image to gallery
  void saveImageToGallery() async {
    final result = await ImageGallerySaver.saveImage(_image!);
    print(result);
    showSnackBar(context, 'Image Saved to Gallery');
  }

  @override
  Widget build(BuildContext context) {
  
    print('Image is ${_image}');
    return Scaffold(
        appBar: AppBar(
          title: Text('Image Picker'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  selectSingleImage(ImageSource.gallery);
                  
                },
                child: Text('Single Gallery'),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  selectSingleImage(ImageSource.camera);
                  
                },
                child: Text('Single Camera'),
              ),
              SizedBox(height: 10,),
             
              _image == null
                  ? Container(child: Text('No Image Selected'))
                  : Container(
                    height: 500,
                    width: 500,
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                              child: isLoading?CircularProgressIndicator():Image.memory(_image!),
                            ),
                          ),
                        SizedBox(height: 10,),
                        ElevatedButton(onPressed: (){
                          // for the package  image_gallery_saver, i have added this line in Manifest.xml 
                          // <application android:requestLegacyExternalStorage="true" .....>
                          saveImageToGallery();
                        }, child: Text('Save Image'))
                      ],
                    ),
                  ),
            
            ],
          ),
        ));
  }
}
