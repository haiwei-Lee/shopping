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
      appBar: AppBar(title: Text("购物车")),
      body: Center(
        child: Text("购物车"),
      ),
    );
  }
}
