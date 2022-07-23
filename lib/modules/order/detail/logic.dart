
import 'package:flutter_quick/events.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../repository/order_repository.dart';
import 'state.dart';

class OrderDetailLogic extends GetxController {
  final state = OrderDetailState();

  @override
  void onInit() {
    super.onInit();
    _getData();
    eventBus.on<UpdateDetailEvent>().listen((event) {
      _getData();
    });
  }

  _getData() {
    OrderRepository.orderDetail(Get.arguments).then((value) {
      if (value != null) {
        state.data = value;
        update();

        // if (value['serviceStartTime'] != null) {
        //   int projectTime =
        //       int.tryParse(value['project']['projectTime'] ?? "1") ?? 1;
        //   // 结束时间
        //   var date = DateTime.parse(value['serviceStartTime'])
        //       .add(Duration(hours: projectTime));

        //   state.timer = Timer.periodic(Duration(seconds: 1), (timer) {
        //     state.duration = date.difference(DateTime.now());
        //     if (state.duration!.inSeconds <= 0) {
        //       timer.cancel();
        //       state.showTimer = false;
        //       update();
        //     }
        //     update();
        //   });
        // }
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    // state.timer?.cancel();
  }

  String getTime() {
    if (state.duration == null) return "";
    var date = DateTime.parse("2020-01-01 00:00:00").add(state.duration!);

    return DateFormat("HH:mm:ss").format(date);
  }
}
