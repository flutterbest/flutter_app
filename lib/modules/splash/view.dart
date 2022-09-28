import 'package:flutter/material.dart';
import 'package:flutter_quick/routes/routes.dart';
import 'package:flutter_quick/widgets/buttons/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class SplashPage extends StatelessWidget {
  final SplashLogic logic = Get.put(SplashLogic());
  final SplashState state = Get.find<SplashLogic>().state;

  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashLogic>(
        builder: (logic) {
          return Container(
            width: 375.w,
            height: 667.h,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage(
                  "assets/images/splash.png",
                ),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 160.h,
                  child: AppButton(
                    title: "登录",
                    onTap: () {
                      Get.toNamed(Routes.login);
                    },
                  ),
                ),
                Positioned(
                  bottom: 88.h,
                  child: AppButton(
                    title: "注册",
                    theme: 2,
                    onTap: () {
                      Get.toNamed(Routes.register);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
