import 'package:flutter/material.dart';
import 'package:flutter_quick/events.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../../../constants/cache.dart';
import '../../../repository/user_repository.dart';
import '../../../utils/helper.dart';
import '../../../widgets/refresh_widget.dart';
import 'state.dart';

class CancelShareLogic extends GetxController
    with GetSingleTickerProviderStateMixin, RefreshListMixin {
  final state = CancelShareState();

  @override
  void onInit() {
    super.onInit();

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
    return UserRepository.artificerIntroduce(1);
  }

  addField() {
    TextEditingController controller = TextEditingController();
    state.cList.add(controller);
    update();
  }
}
