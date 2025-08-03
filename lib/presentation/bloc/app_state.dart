import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void onSelectIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}