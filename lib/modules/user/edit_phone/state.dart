import 'dart:async';

import 'package:flutter/material.dart';

class EditPhoneState {
    var controller1 = TextEditingController(text: ""); // 18161218432
  var controller2 = TextEditingController(text: ""); // 666666
  int seconds = 60;
  String btnText = "获取验证码";
  Timer? timer;
  EditPhoneState() {
    ///Initialize variables
  }
}
