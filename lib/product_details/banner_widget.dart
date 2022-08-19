import 'package:banner_image/banner_image.dart';
import 'package:biyao_shopping/product_details/photo_preview.dart';
import 'package:flutter/material.dart';

class ProductBanner extends StatefulWidget {
  final List<String> imageItems;
  ProductBanner({required this.imageItems}) : assert(imageItems != null);
  @override
  _ProductBannerState createState() => _ProductBannerState();
}

class _ProductBannerState extends State<ProductBanner> {
  var _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.9, 0.7),
      children: [
        BannerImage(
          itemLength: widget.imageItems.length,
          imageUrlList: widget.imageItems,
          autoPlay: true,
          padding: const EdgeInsets.all(0),
          withOutIndicator: true,
          timerDuration: const Duration(seconds: 3),
          onTap: (index) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => PhotoPreview(
                          galleryItems: widget.imageItems,
                          defaultImageIndex: index,
                        )));
          },
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index + 1;
            });
          },
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          height: 20,
          padding: const EdgeInsets.all(2),
          child: Text('$_currentIndex/${widget.imageItems.length}'),
        ),
      ],
    );
  }
}
