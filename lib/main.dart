import 'package:flutter/material.dart';
import 'tab_bar_pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// ignore: prefer_typing_uninitialized_variables
var currentPage;

var currentIndex = 0;

final List _tabs = [const Home(), const Home(), const Home(), const Home()];

final List<BottomNavigationBarItem> _bottomTabs = [
  BottomNavigationBarItem(
      icon: Image.asset(
        "images/icon_tabbar_home_nor.png",
        fit: BoxFit.cover,
        width: 40,
        height: 40,
      ),
      activeIcon: Image.asset(
        "images/icon_tabbar_home_sel.png",
        fit: BoxFit.cover,
        width: 40,
        height: 40,
      ),
      label: "首页"),
  BottomNavigationBarItem(
      icon: Image.asset(
        "images/icon_tabbar_classify_nor.png",
        fit: BoxFit.cover,
        width: 40,
        height: 40,
      ),
      activeIcon: Image.asset(
        "images/icon_tabbar_classify_sel.png",
        fit: BoxFit.cover,
        width: 40,
        height: 40,
      ),
      label: "分类"),
  BottomNavigationBarItem(
      icon: Image.asset(
        "images/icon_tabbar_cart_nor.png",
        fit: BoxFit.cover,
        width: 40,
        height: 40,
      ),
      activeIcon: Image.asset(
        "images/icon_tabbar_cart_sel.png",
        fit: BoxFit.cover,
        width: 40,
        height: 40,
      ),
      label: "购物车"),
  BottomNavigationBarItem(
      icon: Image.asset(
        "images/icon_tabbar_personalcenter_nor.png",
        fit: BoxFit.cover,
        width: 40,
        height: 40,
      ),
      activeIcon: Image.asset(
        "images/icon_tabbar_personalcenter_sel.png",
        fit: BoxFit.cover,
        width: 40,
        height: 40,
      ),
      label: "我的"),
];

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    currentPage = _tabs[currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: _bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = _tabs[currentIndex];
          });
        },
      ),
    );
  }
}
