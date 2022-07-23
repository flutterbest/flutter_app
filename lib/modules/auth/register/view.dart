import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class RegisterPage extends StatelessWidget {
  final RegisterLogic logic = Get.put(RegisterLogic());
  final RegisterState state = Get.find<RegisterLogic>().state;

  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEAF6FF),
      body: GetBuilder<RegisterLogic>(
        builder: (logic) {
          return Container();
        },
      ),
    );
  }
}
