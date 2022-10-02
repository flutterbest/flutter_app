import 'dart:async';

import 'package:common_utils/common_utils.dart';
import 'package:flutter_quick/utils/helper.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import 'state.dart';

class LoginLogic extends GetxController {
  final state = LoginState();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    state.timer?.cancel();
  }

  sendSms() {
    var phone = state.controller1.text;
    if (phone.isEmpty) {
      toast("请输入手机号");
      return;
    }

    if (!RegexUtil.isMobileSimple(phone)) {
      toast("手机号格式错误");
      return;
    }

    if (state.seconds != 60) return;
    // UserRepository.sendSmsCode(phone).then((value) {
    //   logger(value);
    // });
    state.seconds -= 1;
    state.btnText = "${state.seconds}s";
    update();
    state.timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (state.seconds < 1) {
        timer.cancel();
        state.seconds = 60;
        state.btnText = "获取验证码";
        update();

        return;
      }
      state.seconds -= 1;
      state.btnText = "${state.seconds}s";
      update();
    });
  }

  submit() async {
    Get.offAllNamed(Routes.home);
  }
}
