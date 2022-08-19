import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';
import '../utils/color_util.dart';

typedef PageChanged = void Function(int index);

class PhotoPreview extends StatefulWidget {
  final List galleryItems;
  final int defaultImageIndex;
  final PageChanged? pageChanged;
  final Axis direction;
  final Decoration? decoration;
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  PhotoPreview(
      {required this.galleryItems,
      this.defaultImageIndex = 1,
      this.pageChanged,
      this.direction = Axis.horizontal,
      this.decoration})
      // ignore: unnecessary_null_comparison
      : assert(galleryItems != null);

  @override
  // ignore: library_private_types_in_public_api
  _PhotoPreviewState createState() => _PhotoPreviewState();
}

class _PhotoPreviewState extends State<PhotoPreview> {
  late int tempSelect;
  @override
  void initState() {
    super.initState();
    tempSelect = widget.defaultImageIndex + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: GestureDetector(
      child: Stack(
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
            child: PhotoViewGallery.builder(
              itemCount: widget.galleryItems.length,
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(widget.galleryItems[index]));
              },
              scrollPhysics: const BouncingScrollPhysics(),
              scrollDirection: widget.direction,
              // ignore: prefer_const_constructors
              backgroundDecoration: BoxDecoration(color: Colors.white),
              pageController:
                  PageController(initialPage: widget.defaultImageIndex),
              onPageChanged: (index) {
                setState(() {
                  tempSelect = index + 1;
                  if (widget.pageChanged != null) {
                    widget.pageChanged!(index);
                  }
                });
              },
            ),
          ),
          Positioned(
            right: 20,
            top: 20,
            child: Text(
              '$tempSelect/${widget.galleryItems.length}',
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Positioned(
            left: 150,
            bottom: 100,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => ColorHex.fromHex('#784DFA')),
              ),
              child: const Text('点击我'),
            ),
          ),
        ],
      ),
      onTap: () => Navigator.pop(context),
    ));
  }
}
