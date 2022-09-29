import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quick/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/buttons/app_button.dart';
import 'logic.dart';
import 'state.dart';

class EditPhonePage extends StatelessWidget {
  final EditPhoneLogic logic = Get.put(EditPhoneLogic());
  final EditPhoneState state = Get.find<EditPhoneLogic>().state;

  EditPhonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditPhoneLogic>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConstants.appColor,
            elevation: 0,
            title: Text("修改手机号"),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                      hintText: '输入手机号',
                      hintStyle: TextStyle(
                        color: const Color(0xff999999),
                        fontSize: 17.sp,
                      ),
                      suffixIconConstraints: BoxConstraints(maxWidth: 102.w),
                      suffixIcon: Container(
                        height: 25.w,
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
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
                        color: const Color(0xff999999),
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 22.w),
                  AppButton(
                    title: "确定",
                    onTap: logic.submit,
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
