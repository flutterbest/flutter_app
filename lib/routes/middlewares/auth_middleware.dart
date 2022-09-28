import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 检查是否登录
class AuthMiddleware extends GetMiddleware {
  // priority 数字小优先级高

  @override
  RouteSettings? redirect(String? route) {
    return null;

    // if (app().state.isLogin) {
    //   return null;
    // }
    // return const RouteSettings(name: Routes.login);
  }
}
