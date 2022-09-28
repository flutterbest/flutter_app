import 'dart:async';

import 'package:common_utils/common_utils.dart';
import 'package:flutter_quick/repository/user_repository.dart';
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
    UserRepository.sendSmsCode(phone).then((value) {
      logger(value);
    });
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
    // var phone = state.controller1.text;
    // var code = state.controller2.text;
    // if (phone.isEmpty) {
    //   toast("请输入手机号");
    //   return;
    // }
    // if (code.isEmpty) {
    //   toast("请输入验证码");
    //   return;
    // }
    // if (!RegexUtil.isMobileSimple(phone)) {
    //   toast("手机号格式错误");
    //   return;
    // }
    Get.offAllNamed(Routes.home);
    // UserRepository.login(phone, code);

    // var headers = {
    //   'Content-Type': 'application/x-www-form-urlencoded',
    //   'Accept': 'application/json, text/plain, */*',
    //   'Authorization': 'Basic bWFsbC10ZWNobmljaWFuOjEyMzQ1Ng=='
    // };

    // var url = "${Config.apiHost}/lsfb-auth/oauth/token";
    // var request = http.Request('POST', Uri.parse(url));
    // request.bodyFields = {
    //   'grant_type': 'sms_code',
    //   'mobile': phone,
    //   'code': code
    // };
    // request.headers.addAll(headers);
    // EasyLoading.show();
    // http.StreamedResponse response = await request.send();
    // EasyLoading.dismiss();

    // if (response.statusCode == 200) {
    //   var data = await response.stream.bytesToString();
    //   var res = jsonDecode(data);
    //   if (res["code"] == "00000") {
    //     logger(data);
    //     await SpUtil.putString(
    //         CacheConstants.token, res["data"]["access_token"]);
    //     await SpUtil.putString(
    //         CacheConstants.refreshToken, res["data"]["refresh_token"]);
    //     await app().updateUser();
    //     // Timer.periodic(Duration(seconds: 1), (timer) async {
    //     //   timer.cancel();
    //     //   var data = await UserRepository.refresh();
    //     //   logger(data);
    //     // });
    //     // return;
    //     Get.offAllNamed(Routes.home);
    //   }
    // } else {
    //   toast("手机号或验证码错误");
    // }
  }
}
