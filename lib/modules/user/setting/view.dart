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
            title: Text("设备列表"),
            centerTitle: true,
            leadingWidth: 30.w,
            leading: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Center(
                  child: Image.asset(
                    "assets/images/user.png",
                    width: 30.w,
                  ),
                ),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "assets/images/message.png",
                  width: 25.w,
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "assets/images/search.png",
                  width: 25.w,
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "assets/images/add.png",
                  width: 25.w,
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          body: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 15.w),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/tmp1.png",
                      width: 345.w,
                      height: 154.w,
                    ),
                    Container(
                        padding: EdgeInsets.all(15.w),
                        color: Color(0xffefefef),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "设备名称",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "链接网络：HTMILWI-FI",
                                  style: TextStyle(
                                    color: Color(0xff666666),
                                    fontSize: 14.sp,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    "assets/images/edit.png",
                                    width: 25.w,
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    "assets/images/share.png",
                                    width: 25.w,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ],
                ),
              );
            },
            itemCount: 5,
          ),
        );
      },
    );
  }
}
