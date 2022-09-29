import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quick/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/buttons/app_button.dart';
import 'logic.dart';
import 'state.dart';

class EditNamePage extends StatelessWidget {
  final EditNameLogic logic = Get.put(EditNameLogic());
  final EditNameState state = Get.find<EditNameLogic>().state;

  EditNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditNameLogic>(
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
                      hintText: '用户昵称',
                      hintStyle: TextStyle(
                        color: const Color(0xff999999),
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 22.w),
                  AppButton(
                    title: "保存",
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
