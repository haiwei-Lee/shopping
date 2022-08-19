import 'package:flutter/material.dart';

class BannerPage extends ChangeNotifier {
  int page = 1;
  BannerPage();
  void plus() {
    page = page + 1;
    notifyListeners();
  }
}
