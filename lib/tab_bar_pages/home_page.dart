// ignore_for_file: prefer_const_constructors

import 'package:biyao_shopping/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:biyao_shopping/home/home_list_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          // actions: [
          //   IconButton(onPressed: null, icon: Image.asset("")),
          // ],
          // title: ,
          backgroundColor: ColorHex.fromHex("#784DFA"),
          elevation: 0,
          bottom: TabBar(
            indicatorColor: Colors.white,
            isScrollable: true,
            tabs: [
              Tab(
                text: "热门",
              ),
              Tab(
                text: "女装",
              ),
              Tab(
                text: "美妆",
              ),
              Tab(
                text: "内衣配饰",
              ),
              Tab(
                text: "家纺",
              ),
              Tab(
                text: "男装",
              ),
              Tab(
                text: "生鲜直供",
              ),
            ],
          ),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        body: TabBarView(children: <Widget>[
          HomeList(),
          HomeList(),
          HomeList(),
          HomeList(),
          HomeList(),
          HomeList(),
          HomeList()
        ]),
      ),
    );
  }
}
