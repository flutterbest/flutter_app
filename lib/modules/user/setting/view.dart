import 'package:flutter/material.dart';
import 'package:flutter_quick/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class SettingPage extends StatelessWidget {
  final SettingLogic logic = Get.put(SettingLogic());
  final SettingState state = Get.find<SettingLogic>().state;

  SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingLogic>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConstants.appColor,
            elevation: 0,
            title: Text("软件设置"),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                Container(
                  width: 360.w,
                  padding: EdgeInsets.symmetric(vertical: 10.w),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xff999999).withOpacity(.2),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/setting1.png",
                            width: 20.w,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "场景图显示",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Color(0xff333333),
                            ),
                          ),
                        ],
                      ),
                      Switch(
                        value: state.checked,
                        onChanged: (v) {
                          state.checked = v;
                          logic.update();
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  width: 360.w,
                  padding: EdgeInsets.symmetric(vertical: 10.w),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xff999999).withOpacity(.2),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/setting2.png",
                            width: 20.w,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "观看模式",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Color(0xff333333),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "单设备",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Color(0xff666666),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
