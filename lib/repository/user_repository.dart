import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_quick/config/config.dart';
import 'package:flutter_quick/constants/cache.dart';
import 'package:flutter_quick/http/dio_api.dart';
import 'package:flutter_quick/models/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';

import '../routes/routes.dart';
import '../utils/helper.dart';

class UserRepository {
  static Future<bool> refresh() async {
    var headers = {
      'Authorization': 'Basic bWFsbC10ZWNobmljaWFuOjEyMzQ1Ng==',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json, text/plain, */*',
    };
    var request = http.Request(
      'POST',
      Uri.parse('${Config.apiHost}/lsfb-auth/oauth/token'),
    );

    request.bodyFields = {
      'grant_type': 'refresh_token',
      'refresh_token': SpUtil.getString(CacheConstants.refreshToken) ?? '',
    };
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    logger(response.statusCode);

    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      var res = jsonDecode(data);
      if (res["code"] == "00000") {
        SpUtil.putString(CacheConstants.token, res["data"]["access_token"]);
        SpUtil.putString(
            CacheConstants.refreshToken, res["data"]["refresh_token"]);

        Get.offAllNamed(Routes.main);
        toast("token刷新成功");
        return true;
      }
      toast("token刷新失败");

      Get.offAllNamed(Routes.login);

      return false;
    } else {
      toast("token刷新失败");

      Get.offAllNamed(Routes.login);

      return false;
    }
  }

  /// 我的
  static Future info() async {
    var resp = await DioApi.getInstance().post(
        "/lsfb-artificer/artificer/lsfbArtificer/artificerPersonalData",
        queryParameters: {
          "artificerId": app().state.user!.id,
        });
    if (resp.sucess) {
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  /// 技师详情
  static Future<UserModel?> userInfo() async {
    var resp = await DioApi.getInstance().post(
      "/lsfb-artificer/artificer/lsfbArtificer/artificerDetails",
    );
    if (resp.sucess) {
      return UserModel.fromJson(resp.data);
    }
    toast(resp.message);

    return null;
  }

  /// 上下线
  static Future artificerGoOffline(int action) async {
    var resp = await DioApi.getInstance().post(
        "/lsfb-artificer/artificer/lsfbArtificer/artificerGoOffline",
        queryParameters: {
          "action": action,
        });
    if (resp.sucess) {
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  /// 统计
  static Future statistics() async {
    var resp = await DioApi.getInstance()
        .post("/lsfb-artificer/artificer/lsfbSettlement/statistics");
    if (resp.sucess) {
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  /// 钱包
  static Future artificerWallet() async {
    var resp = await DioApi.getInstance()
        .post("/lsfb-artificer/artificer/lsfbArtificer/artificerWallet");
    if (resp.sucess) {
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  /// 结算信息
  static Future artificerSettlement() async {
    var resp = await DioApi.getInstance()
        .post("/lsfb-artificer/artificer/lsfbArtificer/artificerSettlement");
    if (resp.sucess) {
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  /// 结算详情
  static Future detailsSettlement(dynamic orderId) async {
    var resp = await DioApi.getInstance().post(
        "/lsfb-artificer/artificer/lsfbSettlement/detailsSettlement",
        queryParameters: {
          "id": orderId,
        });
    if (resp.sucess) {
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  /// 结算的订单列表的子订单详情
  static Future detailsSettlementOrder(dynamic orderId) async {
    var resp = await DioApi.getInstance().post(
        "/lsfb-artificer/artificer/lsfbSettlement/detailsSettlementOrder",
        queryParameters: {
          "orderId": orderId,
        });
    if (resp.sucess) {
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  /// 结算列表
  static Future listSettlement(int? status) async {
    var resp = await DioApi.getInstance().post(
        "/lsfb-artificer/artificer/lsfbSettlement/listSettlement",
        queryParameters: status == null ? {} : {"status": status});
    if (resp.sucess) {
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  ///  结算的订单列表
  static Future listSettlementOrder(int page, int status) async {
    var resp = await DioApi.getInstance().post(
        "/lsfb-artificer/artificer/lsfbSettlement/listSettlementOrder",
        data: {
          "current": 1,
          "size": 10,
        },
        queryParameters: {
          "status": status,
        });
    if (resp.sucess) {
      return resp.data["records"];
    }
    toast(resp.message);

    return [];
  }

  ///  服务区域设置
  static Future serviceAreaSet(dynamic radius) async {
    var resp = await DioApi.getInstance().post(
        "/lsfb-artificer/artificer/lsfbArtificer/serviceAreaSet",
        queryParameters: {"orderRadius": radius});
    if (resp.sucess) {
      toast("修改成功");

      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  ///  绑定支付宝
  static Future bindAlipay(String account, String name) async {
    var resp = await DioApi.getInstance().post(
        "/lsfb-artificer/artificer/lsfbArtificer/bindAlipay",
        queryParameters: {
          "alipayAccount": account,
          "alipayName": name,
        });
    if (resp.sucess) {
      toast("更新成功");
      Get.back();

      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  ///  评价
  static Future myComment(int current,
      {bool statistics = false, int? grade}) async {
    var resp = await DioApi.getInstance().post(
      "/lsfb-artificer/artificer/lsfbComment/myComment",
      data: {
        "current": current,
        "size": 10,
        "condition": {"grade": grade},
      },
    );
    if (resp.sucess) {
      return !statistics
          ? resp.data["pageData"]["data"]
          : resp.data["statisticsData"];
    }
    toast(resp.message);

    return null;
  }

  ///  获取个人标签列表
  static Future listArtificerPersonalLabel() async {
    var resp = await DioApi.getInstance().post(
      "/lsfb-artificer/artificer/lsfbArtificer/listArtificerPersonalLabel",
    );
    if (resp.sucess) {
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  /// 更新标签列表
  static Future artificerPersonalLabel(dynamic data) async {
    var resp = await DioApi.getInstance().post(
      "/lsfb-artificer/artificer/lsfbArtificer/artificerPersonalLabel",
      data: data,
    );
    if (resp.sucess) {
      toast("保存成功");

      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  ///  申请结算
  static Future applySettlement(List orderIds) async {
    var resp = await DioApi.getInstance().post(
      "/lsfb-artificer/artificer/lsfbSettlement/applySettlement",
      data: orderIds,
    );
    if (resp.sucess) {
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  ///  技师媒体详情  类型：0 照片 1 视频,示例值(1)
  static Future artificerIntroduce(int type) async {
    var resp = await DioApi.getInstance().post(
      "/lsfb-artificer/artificer/lsfbArtificer/artificerIntroduce",
      queryParameters: {
        "artificerId": app().state.user!.id,
        "type": type,
      },
    );
    if (resp.sucess) {
      return resp.data['records'];
    }
    toast(resp.message);

    return null;
  }

  ///  技师媒体上传 类型：0 照片 1 视频,示例值(1)
  static Future artificerUpload(List urls, int type) async {
    var resp = await DioApi.getInstance().post(
      "/lsfb-artificer/artificer/lsfbArtificer/artificerUpload",
      data: urls,
      queryParameters: {
        "type": type,
      },
    );
    EasyLoading.dismiss();
    if (resp.sucess) {
      toast("上传成功");
      Get.back();
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  ///  获取城市信息 等级 1：省 2：市 3：区
  static Future getAllListByCondition(dynamic level, dynamic parentId,
      {int type = 1}) async {
    var resp = await DioApi.getInstance().post(
      type == 1
          ? "/lsfb-artificer/artificer/LsfbServiceCity/getAllListByCondition"
          : "/lsfb-artificer/artificer/LsfbServiceCity/getPageByCondition",
      data: type == 2
          ? {
              "level": level,
              "parentId": parentId,
              "current": 1,
              "size": 99999,
            }
          : {
              "level": level,
              "parentId": parentId,
            },
    );
    EasyLoading.dismiss();
    if (resp.sucess) {
      return type == 2 ? resp.data['data'] : resp.data;
    }
    toast(resp.message);

    return null;
  }

  ///  提交证件资料
  static Future submitCredentials(dynamic params) async {
    var resp = await DioApi.getInstance().post(
      "/lsfb-artificer/artificer/lsfbArtificer/submitCredentials",
      queryParameters: params,
    );
    EasyLoading.dismiss();
    if (resp.sucess) {
      toast("提交成功");
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  ///  更新常驻地址
  static Future artificerResidentAddress(dynamic params) async {
    var resp = await DioApi.getInstance().post(
      "/lsfb-artificer/artificer/lsfbArtificer/artificerResidentAddress",
      data: params,
    );

    EasyLoading.dismiss();

    if (resp.sucess) {
      toast("保存成功");
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  ///  预约时间的操作
  static Future operationTime(dynamic params) async {
    var resp = await DioApi.getInstance().post(
      "/lsfb-artificer/artificer/LsfbArtificerAppointment/operationTime",
      data: params,
    );

    EasyLoading.dismiss();

    if (resp.sucess) {
      toast("保存成功");
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  ///  技师获取预约时间列表
  static Future appointmentList() async {
    var resp = await DioApi.getInstance().post(
      "/lsfb-artificer/artificer/LsfbArtificerAppointment/appointmentList",
    );

    EasyLoading.dismiss();

    if (resp.sucess) {
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  ///  常住地址回显
  static Future artificerResidentAddressEcho() async {
    var resp = await DioApi.getInstance().post(
      "/lsfb-artificer/artificer/lsfbArtificer/artificerResidentAddressEcho",
    );

    if (resp.sucess) {
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  /// 已到达预约地址
  static Future immediatelyArrive(dynamic orderId) async {
    var resp = await DioApi.getInstance().post(
        "/lsfb-artificer/artificer/order/immediatelyArrive",
        queryParameters: {"orderId": orderId});

    if (resp.sucess) {
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  /// 立即出发
  static Future immediatelyDeparture(dynamic orderId) async {
    var resp = await DioApi.getInstance().post(
        "/lsfb-artificer/artificer/order/immediatelyDeparture",
        queryParameters: {"orderId": orderId});

    if (resp.sucess) {
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  /// 工作完成
  static Future immediatelyFinish(dynamic orderId) async {
    var resp = await DioApi.getInstance().post(
        "/lsfb-artificer/artificer/order/immediatelyFinish",
        queryParameters: {"orderId": orderId});

    if (resp.sucess) {
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  /// 立即接单
  static Future immediatelyOrder(dynamic orderId) async {
    var resp = await DioApi.getInstance().post(
        "/lsfb-artificer/artificer/order/immediatelyOrder",
        queryParameters: {"orderId": orderId});

    if (resp.sucess) {
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  /// 开始工作
  static Future immediatelyWork(dynamic orderId) async {
    var resp = await DioApi.getInstance().post(
        "/lsfb-artificer/artificer/order/immediatelyWork",
        queryParameters: {"orderId": orderId});

    if (resp.sucess) {
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  /// 发送验证码
  static Future sendSmsCode(dynamic phoneNumber) async {
    var resp = await DioApi.getInstance().post(
        "/lsfb-auth/sms-code/sendSmsCode",
        queryParameters: {"phoneNumber": phoneNumber});

    if (resp.sucess) {
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  /// 证件资料回显
  static Future getCredentials() async {
    var resp = await DioApi.getInstance()
        .post("/lsfb-artificer/artificer/lsfbArtificer/getCredentials");

    if (resp.sucess) {
      return resp.data;
    }
    toast(resp.message);

    return null;
  }

  /// e签宝
  static Future userCooperationAgreement() async {
    var resp = await DioApi.getInstance().post(
        "/lsfb-artificer/artificer/lsfbArtificer/userCooperationAgreement");

    if (resp.sucess) {
      return resp.data;
    }
    toast(resp.message);

    return null;
  }
}
