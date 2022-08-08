import 'package:flutter/material.dart';

class Classification extends StatefulWidget {
  const Classification({Key? key}) : super(key: key);

  @override
  State<Classification> createState() => _ClassificationPageState();
}

class _ClassificationPageState extends State<Classification> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("分类"),
      ),
    );
  }
}
