class Config {
  static const bool isDebug = true;
  static const int env = 1; // 1:dev 测试环境 2:prod 生产环境

  /// 接口地址 192.168.1.44 120.24.59.221
  static const String apiHost =
      env == 1 ? "https://26155t19p1.goho.co" : "http://app.lohanhome.com:8080";

  /// 应用名字
  static const String appName = '罗汉到家技师端';

  /// 接口验证通过时的返回码
  static const List<dynamic> successCodeValues = ["00000"];
  static const List<dynamic> unauthorizedCodeValues = ["A0230"];

  /// 接口code对应字段名字
  static const String codeFiledName = "code";

  /// 接口message字段名
  static const String messageFiledName = "msg";
}
