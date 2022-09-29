import 'package:flutter_quick/modules/auth/login/view.dart';
import 'package:flutter_quick/modules/auth/register/view.dart';
import 'package:flutter_quick/modules/camera/cancel_share/view.dart';
import 'package:flutter_quick/modules/camera/wifi_password/view.dart';
import 'package:flutter_quick/modules/splash/view.dart';
import 'package:flutter_quick/modules/user/edit_name/view.dart';
import 'package:flutter_quick/modules/user/edit_phone/view.dart';
import 'package:flutter_quick/modules/webview/view.dart';
import 'package:get/get.dart';

import '../modules/about/view.dart';
import '../modules/camera/add/view.dart';
import '../modules/camera/detail/view.dart';
import '../modules/camera/edit/view.dart';
import '../modules/camera/message/view.dart';
import '../modules/camera/search/view.dart';
import '../modules/camera/share/view.dart';
import '../modules/camera/wifi/view.dart';
import '../modules/home/view.dart';
import '../modules/user/info/view.dart';
import '../modules/user/setting/view.dart';
import 'middlewares/auth_middleware.dart';

class Routes {
  static const String home = "/home";
  static const String login = "/login";
  static const String register = "/register";
  static const String splash = "/splash";
  static const String webview = "/webview";
  static const String detail = "/detail";
  static const String add = "/add";
  static const String edit = "/edit";
  static const String message = "/message";
  static const String search = "/search";
  static const String share = "/share";
  static const String wifi = "/wifi";
  static const String editName = "/editName";
  static const String editPhone = "/editPhone";
  static const String info = "/info";
  static const String setting = "/setting";
  static const String about = "/about";
  static const String wifiPassword = "/wifiPassword";
  static const String cancelShare = "/cancelShare";

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
    GetPage(
        middlewares: [AuthMiddleware()],
        name: detail,
        page: () => DetailPage()),
    GetPage(
      middlewares: [AuthMiddleware()],
      name: add,
      page: () => AddPage(),
    ),
    GetPage(
      middlewares: [AuthMiddleware()],
      name: edit,
      page: () => EditPage(),
    ),
    GetPage(
        middlewares: [AuthMiddleware()],
        name: message,
        page: () => MessagePage()),
    GetPage(
        middlewares: [AuthMiddleware()],
        name: search,
        page: () => SearchPage()),
    GetPage(
      middlewares: [AuthMiddleware()],
      name: share,
      page: () => SharePage(),
    ),
    GetPage(
      middlewares: [AuthMiddleware()],
      name: wifi,
      page: () => WifiPage(),
    ),
    GetPage(
        middlewares: [AuthMiddleware()],
        name: editName,
        page: () => EditNamePage()),
    GetPage(
        middlewares: [AuthMiddleware()],
        name: editPhone,
        page: () => EditPhonePage()),
    GetPage(
      middlewares: [AuthMiddleware()],
      name: info,
      page: () => InfoPage(),
    ),
    GetPage(
        middlewares: [AuthMiddleware()],
        name: setting,
        page: () => SettingPage()),
    GetPage(
      middlewares: [AuthMiddleware()],
      name: about,
      page: () => AboutPage(),
    ),
    GetPage(
      middlewares: [AuthMiddleware()],
      name: wifiPassword,
      page: () => WifiPasswordPage(),
    ),
    GetPage(
      middlewares: [AuthMiddleware()],
      name: cancelShare,
      page: () => CancelSharePage(),
    ),
  ];
}
