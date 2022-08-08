// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Mine extends StatefulWidget {
  const Mine({Key? key}) : super(key: key);

  @override
  State<Mine> createState() => _MinePageState();
}

class _MinePageState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text("我的"),
      ),
    );
  }
}
