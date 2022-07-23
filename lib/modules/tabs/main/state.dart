import 'package:flutter/cupertino.dart';
import 'package:flutter_quick/modules/tabs/order/view.dart';
import 'package:flutter_quick/modules/tabs/time/view.dart';

import '../my/view.dart';

class MainState {
  int current = 0;
  PageController pageController = PageController(initialPage: 0);
  List<Widget> pages = [
    OrderPage(),
    TimePage(),
    MyPage(),
  ];
  MainState() {
    ///Initialize variables
  }
}
