import 'package:banner_image/banner_image.dart';
import 'package:biyao_shopping/product_details/banner_widget.dart';
import 'package:biyao_shopping/product_details/photo_preview.dart';
import 'package:biyao_shopping/product_details/product_detail_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _imageList = [
  'http://t14.baidu.com/it/u=1682967921,618817946&fm=224&app=112&f=JPEG?w=500&h=500',
  'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1113%2F052420110515%2F200524110515-11-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1663398525&t=f2d5ac1f0e29e33af1834f762c1b1bd0',
  'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.jj20.com%2Fup%2Fallimg%2F1011%2F010QG05111%2F1F10Q05111-3.jpg&refer=http%3A%2F%2Fpic.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1663398525&t=573eaa4783c0e892073a081ad306eda8',
];

// ignore: must_be_immutable
class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  var _currentIndex = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ProductBanner(imageItems: _imageList),
        const SizedBox(height: 10),
        ProductInfoView(),
      ],
    ));
  }
}
