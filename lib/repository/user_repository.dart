import 'package:flutter_quick/http/dio_api.dart';

import '../utils/helper.dart';

class UserRepository {
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
