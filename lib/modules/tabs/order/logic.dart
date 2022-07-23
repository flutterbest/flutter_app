import 'package:flutter/material.dart';
import 'package:flutter_quick/events.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../../../constants/cache.dart';
import '../../../repository/order_repository.dart';
import '../../../utils/helper.dart';
import '../../../widgets/refresh_widget.dart';
import 'state.dart';

class OrderLogic extends GetxController
    with GetSingleTickerProviderStateMixin, RefreshListMixin {
  final state = OrderState();

  @override
  void onInit() {
    super.onInit();
    state.tabController = TabController(length: 4, vsync: this);
    state.tabController.index = state.currentTab;
    state.tabController.addListener(() {
      if (!state.tabController.indexIsChanging) {
        int index = state.tabController.index;
        state.currentTab = index;
        refreshData();
      }
    });

    eventBus.on<UpdateTabEvent>().listen((event) {
      if (event.tab == 0) {
        refreshData();
      }
    });
    //
    eventBus.on<UpdateEvent>().listen((event) {
      update();
    });
    logger(SpUtil.getString(CacheConstants.token) ?? '');
    if (!app().state.isLogin) return;

    refreshData();
  }

  @override
  Future initData({int currentPage = 1}) {
    return OrderRepository.pageOrder(state.status, currentPage);
  }
}
