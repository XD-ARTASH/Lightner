import 'package:flutter/material.dart';

class MainViewProvider extends ChangeNotifier {

  int _page = 2;

  int getPage() {
    return _page;
  }

  void setPage(int x) {
    _page = x;
    notifyListeners();
  }

}