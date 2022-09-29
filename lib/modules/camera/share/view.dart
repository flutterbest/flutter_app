import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quick/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../widgets/buttons/app_button.dart';
import 'logic.dart';
import 'state.dart';

class SharePage extends StatelessWidget {
  final ShareLogic logic = Get.put(ShareLogic());
  final ShareState state = Get.find<ShareLogic>().state;

  SharePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShareLogic>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConstants.appColor,
            elevation: 0,
            title: Text("共享设备"),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.w),
                  Text(
                    "设备名称:xxxx",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xff999999),
                    ),
                  ),
                  ...state.cList
                      .mapIndexed(
                        (index, element) => Container(
                          margin: EdgeInsets.only(top: 10.w),
                          child: TextField(
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
                                    "好友账号",
                                  ),
                                ),
                              ),
                              prefixIconConstraints:
                                  BoxConstraints(maxWidth: 80.w),
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
                              hintText: '请输入好友的账号',
                              hintStyle: TextStyle(
                                color: const Color(0xff999999),
                                fontSize: 17.sp,
                              ),
                              suffixIcon: state.cList.length - 1 != index
                                  ? null
                                  : GestureDetector(
                                      onTap: () {
                                        logic.addField();
                                      },
                                      child:
                                          Image.asset("assets/images/add2.png"),
                                    ),
                              suffixIconConstraints: BoxConstraints(
                                maxWidth: 16.w,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  SizedBox(height: 60.w),
                  AppButton(
                    title: "发送共享",
                    onTap: () {
                      Get.toNamed(Routes.cancelShare);
                    },
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
