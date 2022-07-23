import 'package:flutter/material.dart';

class OrderState {
  int currentTab = 0;
  int status = 0; // 	订单状态 0：待接单 1：进行中 2：已取消 3：已完成
  late TabController tabController;
  OrderState() {
    ///Initialize variables
  }
}
