import 'package:flutter/material.dart';
import 'package:flutter_quick/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class AboutPage extends StatelessWidget {
  final AboutLogic logic = Get.put(AboutLogic());
  final AboutState state = Get.find<AboutLogic>().state;

  AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutLogic>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConstants.appColor,
            elevation: 0,
            title: Text("关于我们"),
            centerTitle: true,
          ),
        );
      },
    );
  }
}
