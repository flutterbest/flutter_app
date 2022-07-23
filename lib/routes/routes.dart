import 'package:flutter_quick/modules/auth/login/view.dart';
import 'package:flutter_quick/modules/auth/register/view.dart';

import 'package:flutter_quick/modules/order/amount_list/view.dart';
import 'package:flutter_quick/modules/splash/view.dart';
import 'package:flutter_quick/modules/webview/view.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../constants/cache.dart';
import '../modules/order/detail/view.dart';
import '../modules/order/payment/view.dart';
import '../modules/tabs/main/view.dart';
import 'middlewares/auth_middleware.dart';

class Routes {
  static const String main = "/main";
  static const String login = "/login";
  static const String register = "/register";
  static const String splash = "/splash";
  static const String orderDetail = "/orderDetail";
  static const String orderPayment = "/orderPayment";
  static const String test = "/test";
  static const String address = "/address";
  static const String alipay = "/alipay";
  static const String avatar = "/avatar";
  static const String certificate = "/certificate";
  static const String comment = "/comment";
  static const String introduce = "/introduce";
  static const String serviceAddress = "/serviceAddress";
  static const String serviceArea = "/serviceArea";
  static const String setting = "/setting";
  static const String settlement = "/settlement";
  static const String settlementDetail = "/settlementDetail";
  static const String settlementList = "/settlementList";
  static const String statistical = "/statistical";
  static const String tag = "/tag";
  static const String upload = "/upload";
  static const String wallet = "/wallet";
  static const String amountList = "/amountList";
  static const String preview = "/preview";
  static const String webview = "/webview";

  /// 初始化路由
  static String initialRoute =
      (SpUtil.getBool(CacheConstants.firstLaunch) ?? true) ? splash : main;

  static final pages = [
    GetPage(name: login, page: () => LoginPage()),
    GetPage(
        middlewares: [AuthMiddleware()],
        name: register,
        page: () => RegisterPage()),
    GetPage(
        middlewares: [AuthMiddleware()], name: main, page: () => MainPage()),
    GetPage(
        middlewares: [AuthMiddleware()],
        name: splash,
        page: () => SplashPage()),
    GetPage(
        middlewares: [AuthMiddleware()],
        name: orderDetail,
        page: () => OrderDetailPage()),
    GetPage(
        middlewares: [AuthMiddleware()],
        name: orderPayment,
        page: () => OrderPaymentPage()),
    GetPage(
        middlewares: [AuthMiddleware()],
        name: webview,
        page: () => WebViewPage()),
  ];
}
