import 'package:flutter/material.dart';

class BottomNavViewModel extends ChangeNotifier {
  int currentPage = 0;

  setIndex({required int index}) {
    currentPage = index;
    notifyListeners();
  }

  void changePage(int newPage) {
    currentPage = newPage;
    notifyListeners();
  }
}
