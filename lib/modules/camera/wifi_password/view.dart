import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quick/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/buttons/app_button.dart';
import 'logic.dart';
import 'state.dart';

class WifiPasswordPage extends StatelessWidget {
  final WifiPasswordLogic logic = Get.put(WifiPasswordLogic());
  final WifiPasswordState state = Get.find<WifiPasswordLogic>().state;

  WifiPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WifiPasswordLogic>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConstants.appColor,
            elevation: 0,
            title: Text("wifi名称"),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 30.w),
                  Text(
                    "您可靠近陆游毮起，待路由器上的灯闪烁后，按下“H”健等待自动连接，无需输入密码。",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xff999999),
                    ),
                  ),
                  SizedBox(height: 10.w),
                  TextField(
                    controller: state.controller,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.sp,
                    ),
                    cursorColor: Colors.black,
                    textAlign: TextAlign.left,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      prefixIcon: Center(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "密码",
                          ),
                        ),
                      ),
                      prefixIconConstraints: BoxConstraints(maxWidth: 60.w),
                      contentPadding: EdgeInsets.only(top: 15.w, bottom: 15.w),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorConstants.borderColor,
                          width: 1,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorConstants.borderColor,
                          width: 1,
                        ),
                      ),
                      hintText: '请输入设备密码',
                      hintStyle: TextStyle(
                        color: const Color(0xff999999),
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 60.w),
                  AppButton(
                    title: "连接",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
