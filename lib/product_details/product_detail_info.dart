import 'package:flutter/material.dart';

class ProductInfoView extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ProductInfoView();
  @override
  // ignore: library_private_types_in_public_api
  _ProductInfoViewState createState() => _ProductInfoViewState();
}

class _ProductInfoViewState extends State<ProductInfoView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                '￥89',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
              SizedBox(width: 8),
              Text(
                "支持花呗分期付款",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Text(
                "LANCOME同原料制造商",
                style: TextStyle(color: Colors.orange),
                textAlign: TextAlign.left,
              ),
              Expanded(child: Text('')),
              Text(
                "生产周期：3天",
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              '蒙娜丽莎的爽肤水',
              style: TextStyle(color: Colors.black, fontSize: 16),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 4),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              '一年四季的温柔',
              style: TextStyle(color: Colors.grey, fontSize: 12),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Image.asset("images/bg_maierfanyi.png"),
            ],
          ),
        ],
      ),
    );
  }
}
