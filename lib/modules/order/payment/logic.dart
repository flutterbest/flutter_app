import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quick/repository/order_repository.dart';
import 'package:flutter_quick/utils/helper.dart';
import 'package:get/get.dart';

import 'state.dart';

class OrderPaymentLogic extends GetxController {
  final state = OrderPaymentState();

  @override
  void onInit() {
    super.onInit();
    var orderNo = Get.arguments;
    OrderRepository.receiptQrCode(orderNo).then((value) {
      logger(value);
      if (value != null) {
        state.data = value;
        var image = base64Decode(value['qrCode']);
        state.image = Image.memory(image);
        update();
        // 轮询
        state.timer = Timer.periodic(Duration(seconds: 2), (t) {
          OrderRepository.orderPoll(orderNo).then((value) {
            if (value != null && value) {
              showDialog(
                context: Get.context!,
                builder: (context) {
                  return AlertDialog(
                    title: Text("提示"),
                    content: Text("支付成功?"),
                    actions: <Widget>[
                      TextButton(
                        child: Text("确认"),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          });
        });
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    state.timer?.cancel();
  }
}
