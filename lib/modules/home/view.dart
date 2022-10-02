import 'package:flutter/material.dart';
import 'package:flutter_quick/constants/colors.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class HomePage extends StatelessWidget {
  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(
      builder: (_) {
        return Scaffold(
          key: state.scaffoldKey,
          appBar: AppBar(
            backgroundColor: ColorConstants.appColor,
            elevation: 0,
            title: Text("设备列表"),
            centerTitle: true,
          ),
        );
      },
    );
  }
}
