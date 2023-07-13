import 'package:flutter/material.dart';
import 'package:gallery_image_viewer/gallery_image_viewer.dart';

class ImageGallery extends StatefulWidget {
  final String title;

  const ImageGallery({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  final List<ImageProvider> _imageProviders = [
    Image.network("https://picsum.photos/id/237/200/300").image,
    Image.network("https://picsum.photos/seed/picsum/200/300").image,
    Image.network("https://picsum.photos/200/300?grayscale").image,
    Image.network("https://picsum.photos/200/300").image,
    Image.network("https://picsum.photos/200/300?grayscale").image
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: const Text("Show Single Image"),
                onPressed: () {
                  showImageViewer(
                      context,
                      Image.network("https://picsum.photos/id/237/200/300")
                          .image,
                      swipeDismissible: true);
                }),
            ElevatedButton(
                child: const Text("Show Multiple Images (Simple)"),
                onPressed: () {
                  MultiImageProvider multiImageProvider =
                      MultiImageProvider(_imageProviders);
                  showImageViewerPager(context, multiImageProvider,
                      swipeDismissible: true);
                }),
            const Text("<<<< Gallery type 1 >>>>"),
            GalleryImageView(
              listImage: _imageProviders,
              width: 200,
              height: 200,
              imageDecoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              galleryType: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("<<<< Gallery type 2 >>>>"),
            GalleryImageView(
              listImage: _imageProviders,
              width: 200,
              height: 200,
              imageDecoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              galleryType: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("<<<< Gallery type 3 >>>>"),
            GalleryImageView(
              listImage: _imageProviders,
              width: 200,
              height: 200,
              imageDecoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              galleryType: 3,
            )
          ],
        )),
      ),
    );
  }
}

class CustomImageProvider extends EasyImageProvider {
  @override
  final int initialIndex;
  final List<String> imageUrls;

  CustomImageProvider({required this.imageUrls, this.initialIndex = 0})
      : super();

  @override
  ImageProvider<Object> imageBuilder(BuildContext context, int index) {
    return NetworkImage(imageUrls[index]);
  }

  @override
  int get imageCount => imageUrls.length;
}