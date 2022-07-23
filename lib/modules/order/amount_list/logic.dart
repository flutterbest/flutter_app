import 'package:get/get.dart';

import '../../../repository/order_repository.dart';
import 'state.dart';

class AmountListLogic extends GetxController {
  final state = AmountListState();

  @override
  void onInit() {
    super.onInit();

    OrderRepository.clockUpAmountList(Get.arguments).then((value) {
      if (value != null) {
        state.list = value;
        update();
      }
    });
  }
}
