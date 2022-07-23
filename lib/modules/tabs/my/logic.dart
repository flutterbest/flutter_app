import 'package:flutter_quick/repository/user_repository.dart';
import 'package:get/get.dart';

import '../../../events.dart';
import '../../../utils/helper.dart';
import 'state.dart';

class MyLogic extends GetxController {
  final state = MyState();

  @override
  void onInit() {
    super.onInit();
    if (!app().state.isLogin) return;
    eventBus.on<UpdateTabEvent>().listen((event) {
      if (event.tab == 2) {
        updateUserInfo();
      }
    });
    updateUserInfo();
  }

  updateUserInfo() {
    UserRepository.info().then((value) {
      if (value != null) {
        state.userInfo = value;
        update();
      }
    });
    app().updateUser();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
