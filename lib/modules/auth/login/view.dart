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
          body: Container(
            width: 375.w,
            height: 667.h,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage(
                  "assets/images/login.png",
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 25.w,
                right: 25.w,
                top: 50.w,
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 200.h),
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
                          prefixIcon: Center(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "手机号",
                              ),
                            ),
                          ),
                          prefixIconConstraints: BoxConstraints(maxWidth: 60.w),
                          contentPadding:
                              EdgeInsets.only(top: 15.w, bottom: 15.w),
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
                          hintText: '输入手机号',
                          hintStyle: TextStyle(
                            color: const Color(0xff999999),
                            fontSize: 17.sp,
                          ),
                          suffixIconConstraints:
                              BoxConstraints(maxWidth: 102.w),
                          suffixIcon: Container(
                            height: 25.w,
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: Color(0xff3A9CF3),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: logic.sendSms,
                              child: Center(
                                child: Text(
                                  state.btnText,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Color(0xff3A9CF3),
                                  ),
                                ),
                              ),
                            ),
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
                          prefixIcon: Center(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "验证码",
                              ),
                            ),
                          ),
                          prefixIconConstraints: BoxConstraints(maxWidth: 60.w),
                          contentPadding:
                              EdgeInsets.only(top: 15.w, bottom: 15.w),
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
                            color: const Color(0xff999999),
                            fontSize: 17.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 22.w),
                      AppButton(
                        title: "登录",
                        onTap: logic.submit,
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5.w),
                            width: 130.w,
                            height: 1.w,
                            color: Color(0xffd8d8d8),
                          ),
                          Text(
                            "快捷登录",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xff999999),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5.w),
                            width: 130.w,
                            height: 1.w,
                            color: Color(0xffd8d8d8),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.w),
                      Image.asset(
                        "assets/images/wechat.png",
                        width: 40.w,
                      ),
                      SizedBox(height: 60.w),
                    ],
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 325.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              width: 30.w,
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            "登录",
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            width: 30.w,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
