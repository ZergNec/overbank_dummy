import 'package:flutter/foundation.dart';

class TabSwitcher with ChangeNotifier {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  set tabIndex(int newValue) {
    _tabIndex = newValue;
    notifyListeners();
  }
}
