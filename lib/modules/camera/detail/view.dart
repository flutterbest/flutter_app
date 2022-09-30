import 'package:flutter/material.dart';
import 'package:flutter_quick/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class DetailPage extends StatelessWidget {
  final DetailLogic logic = Get.put(DetailLogic());
  final DetailState state = Get.find<DetailLogic>().state;

  DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailLogic>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConstants.appColor,
            elevation: 0,
            title: Text("设备名称"),
            centerTitle: true,
            actions: [
              GestureDetector(
                onTap: () {},
                child: Center(
                  child: Text(
                    "切换视频",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/tmp1.png",
                width: 375.w,
                height: 250.w,
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20.w,
                  horizontal: 15.w,
                ),
                margin: EdgeInsets.only(bottom: 20.w),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        state.tab = 0;
                        logic.update();
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/detail1.png",
                            height: 24.w,
                          ),
                          SizedBox(height: 10.w),
                          Text(
                            "对讲",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xff333333),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        state.tab = 1;
                        logic.update();
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/detail2.png",
                            height: 24.w,
                          ),
                          SizedBox(height: 10.w),
                          Text(
                            "镜像",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xff333333),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        state.tab = 2;
                        logic.update();
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/detail3.png",
                            height: 24.w,
                          ),
                          SizedBox(height: 10.w),
                          Text(
                            "翻转",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xff333333),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        state.tab = 3;
                        logic.update();
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/detail4.png",
                            height: 24.w,
                          ),
                          SizedBox(height: 10.w),
                          Text(
                            "公网",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xff333333),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: state.tabController,
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        width: 375.w,
                        padding: EdgeInsets.symmetric(
                            vertical: 15.w, horizontal: 15.w),
                        margin: EdgeInsets.only(bottom: 20.w),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "颜色调整",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Color(0xff333333),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "视频对比度调整",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xff666666),
                                    ),
                                  ),
                                  Text(
                                    "${state.value1.toInt()}",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xff666666),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Slider(
                              min: 0,
                              max: 100,
                              value: 10,
                              onChanged: (v) {
                                state.value1 = v;
                                logic.update();
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "视频饱和度调整",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xff666666),
                                    ),
                                  ),
                                  Text(
                                    "${state.value2.toInt()}",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xff666666),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Slider(
                              min: 0,
                              max: 100,
                              value: 10,
                              onChanged: (v) {
                                state.value2 = v;
                                logic.update();
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "视频亮度调整",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xff666666),
                                    ),
                                  ),
                                  Text(
                                    "${state.value3.toInt()}",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xff666666),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Slider(
                              min: 0,
                              max: 100,
                              value: 10,
                              onChanged: (v) {
                                state.value3 = v;
                                logic.update();
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "视频色相调整",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xff666666),
                                    ),
                                  ),
                                  Text(
                                    "${state.value4.toInt()}",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xff666666),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Slider(
                              min: 0,
                              max: 100,
                              value: 10,
                              onChanged: (v) {
                                state.value4 = v;
                                logic.update();
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "视频背光补偿",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xff666666),
                                    ),
                                  ),
                                  Text(
                                    "${state.value5.toInt()}",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xff666666),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Slider(
                              min: 0,
                              max: 100,
                              value: 10,
                              onChanged: (v) {
                                state.value5 = v;
                                logic.update();
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "码率设置",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xff666666),
                                    ),
                                  ),
                                  Text(
                                    "${state.value6.toInt()}",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xff666666),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Slider(
                              min: 0,
                              max: 100,
                              value: 10,
                              onChanged: (v) {
                                state.value6 = v;
                                logic.update();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 375.w,
                      padding: EdgeInsets.symmetric(
                          vertical: 15.w, horizontal: 15.w),
                      margin: EdgeInsets.only(bottom: 20.w),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "网络信息",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Color(0xff333333),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 15.w),
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
                                Text(
                                  "IP地址",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Color(0xff666666),
                                  ),
                                ),
                                Text(
                                  "255.255.255.0",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Color(0xff666666),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 15.w),
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
                                Text(
                                  "子网掩码",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Color(0xff666666),
                                  ),
                                ),
                                Text(
                                  "255.255.255.0",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Color(0xff666666),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 15.w),
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
                                Text(
                                  "网关",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Color(0xff666666),
                                  ),
                                ),
                                Text(
                                  "255.255.255.0",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Color(0xff666666),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 15.w),
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
                                Text(
                                  "DNS服务器",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Color(0xff666666),
                                  ),
                                ),
                                Text(
                                  "255.255.255.0",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Color(0xff666666),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
