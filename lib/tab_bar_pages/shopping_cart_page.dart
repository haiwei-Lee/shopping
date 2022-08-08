import 'package:biyao_shopping/utils/color_util.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);
  @override
  State<ShoppingCart> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("购物车", style: TextStyle(color: ColorHex.fromHex("#333333"))),
        backgroundColor: ColorHex.fromHex(
          "#f2f2f2",
        ),
        elevation: 0,
        actions: [
          ElevatedButton(
              onPressed: null,
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(ColorHex.fromHex("#f2f2f2"))),
              child: Text(
                "编辑",
                style: TextStyle(color: ColorHex.fromHex("#333333")),
              )),
        ],
      ),
      body: const Center(
        child: Text("购物车"),
      ),
    );
  }
}
