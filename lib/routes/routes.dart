import 'package:flutter_quick/modules/auth/login/view.dart';
import 'package:flutter_quick/modules/auth/register/view.dart';
import 'package:flutter_quick/modules/splash/view.dart';
import 'package:flutter_quick/modules/webview/view.dart';
import 'package:get/get.dart';

import '../modules/home/view.dart';
import 'middlewares/auth_middleware.dart';

class Routes {
  static const String home = "/home";
  static const String login = "/login";
  static const String register = "/register";
  static const String splash = "/splash";
  static const String webview = "/webview";

  /// 初始化路由
  static String initialRoute = home;
  // (SpUtil.getBool(CacheConstants.firstLaunch) ?? true) ? splash : main;

  static final pages = [
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(
        middlewares: [AuthMiddleware()],
        name: register,
        page: () => RegisterPage()),
    GetPage(
      middlewares: [AuthMiddleware()],
      name: home,
      page: () => HomePage(),
    ),
    GetPage(
        middlewares: [AuthMiddleware()],
        name: splash,
        page: () => SplashPage()),
    GetPage(
        middlewares: [AuthMiddleware()],
        name: webview,
        page: () => WebViewPage()),
  ];
}
