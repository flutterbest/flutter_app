import 'package:flutter_quick/events.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../../../constants/cache.dart';
import '../../../utils/helper.dart';
import '../../../widgets/refresh_widget.dart';
import '../../repository/user_repository.dart';
import 'state.dart';

class HomeLogic extends GetxController
    with GetSingleTickerProviderStateMixin, RefreshListMixin {
  final state = HomeState();

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
}
