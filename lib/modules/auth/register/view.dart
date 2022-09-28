import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quick/constants/colors.dart';
import 'package:flutter_quick/widgets/buttons/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class RegisterPage extends StatelessWidget {
  final RegisterLogic logic = Get.put(RegisterLogic());
  final RegisterState state = Get.find<RegisterLogic>().state;

  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterLogic>(
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
                  "assets/images/register.png",
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
                        title: "注册",
                        onTap: logic.submit,
                      ),
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
                            "注册",
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
