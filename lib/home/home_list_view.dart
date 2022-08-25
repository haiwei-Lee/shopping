import 'package:biyao_shopping/comment/comment_list_page.dart';
import 'package:biyao_shopping/product_details/normal_product_detail.dart';
import 'package:flutter/material.dart';

class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);
  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("aaaaa"),
              subtitle: Text("bbbbbb"),
              onTap: () => _checkItem(index),
            );
          }),
    );
  }

  void _checkItem(int index) {
    bool indexType = (index % 2 == 0);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return indexType ? CommentListPage() : ProductDetailsPage();
    }));
  }
}
