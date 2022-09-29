import 'dart:async';

import 'package:common_utils/common_utils.dart';
import 'package:flutter_quick/events.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../../../constants/cache.dart';
import '../../../repository/user_repository.dart';
import '../../../utils/helper.dart';
import '../../../widgets/refresh_widget.dart';
import 'state.dart';

class EditPhoneLogic extends GetxController
    with GetSingleTickerProviderStateMixin, RefreshListMixin {
  final state = EditPhoneState();

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
    // Get.offAndToNamed(Routes.login);
    // UserRepository.Register(phone, code);

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

}
