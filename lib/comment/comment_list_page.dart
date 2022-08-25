import 'package:biyao_shopping/utils/color_util.dart';
import 'package:flutter/material.dart';

class CommentListPage extends StatefulWidget {
  @override
  _CommentListPageState createState() => _CommentListPageState();
}

class _CommentListPageState extends State<CommentListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('评价列表'),
          backgroundColor: ColorHex.fromHex('#784DFA'),
        ),
        body: Column(
          children: [
            const Text('评价列表'),
          ],
        ));
  }
}
