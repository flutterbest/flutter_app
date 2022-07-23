import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quick/constants/colors.dart';
import 'package:flutter_quick/widgets/buttons/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class LoginPage extends StatelessWidget {
  final LoginLogic logic = Get.put(LoginLogic());
  final LoginState state = Get.find<LoginLogic>().state;

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginLogic>(
      builder: (logic) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            // leading: GestureDetector(
            //   onTap: () {
            //     Get.back();
            //   },
            //   child: Container(
            //     padding: EdgeInsets.only(left: 25.w),
            //     child: Image.asset(
            //       "assets/images/close.png",
            //       width: 20.w,
            //       height: 20.w,
            //     ),
            //   ),
            // ),
            leadingWidth: 45.w,
            elevation: 0,
          ),
          body: Padding(
            padding: EdgeInsets.only(
              left: 25.w,
              right: 25.w,
              top: 50.w,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "您好！\n欢迎来到罗汉到家技师端",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 26.sp,
                    ),
                  ),
                ),
                SizedBox(height: 55.w),
                TextField(
                  controller: state.controller1,
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
                    hintText: '输入11位手机号码',
                    hintStyle: TextStyle(
                      color: const Color(0xff898989),
                      fontSize: 17.sp,
                    ),
                    suffixIconConstraints: BoxConstraints(maxWidth: 30.w),
                    suffixIcon: Image.asset(
                      "assets/images/phone.png",
                      width: 30.w,
                    ),
                  ),
                ),
                SizedBox(height: 35.w),
                TextField(
                  controller: state.controller2,
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
                    hintText: '请输入验证码',
                    hintStyle: TextStyle(
                      color: const Color(0xff898989),
                      fontSize: 17.sp,
                    ),
                    suffixIconConstraints: BoxConstraints(maxWidth: 102.w),
                    suffixIcon: Container(
                      width: 102.w,
                      height: 36.w,
                      decoration: BoxDecoration(
                        color: ColorConstants.appColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: GestureDetector(
                        onTap: logic.sendSms,
                        child: Center(
                          child: Text(
                            state.btnText,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 22.w),
                AppButton(
                  title: "登录",
                  onTap: logic.submit,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
