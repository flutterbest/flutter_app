import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import 'logic.dart';
import 'state.dart';

class InfoPage extends StatelessWidget {
  final InfoLogic logic = Get.put(InfoLogic());
  final InfoState state = Get.find<InfoLogic>().state;

  InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoLogic>(
      builder: (_) {
        return Scaffold(
          body: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: 375.w,
                    height: 225.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color(0xff5CB0FB),
                          Color(0xffA6ECE2),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 40.w),
                        Container(
                          width: 75.w,
                          height: 64.w,
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/info1.png",
                                width: 64.w,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 11.w,
                                child: Image.asset(
                                  "assets/images/info2.png",
                                  width: 22.w,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 15.w),
                        Text(
                          "昵称啊啊啊啊",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.editName);
                          },
                          child: Container(
                            width: 360.w,
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
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/info3.png",
                                      width: 20.w,
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      "修改昵称",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Color(0xff333333),
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff999999),
                                  size: 14,
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.editPhone);
                          },
                          child: Container(
                            width: 360.w,
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
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/info4.png",
                                      width: 20.w,
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      "修改手机号",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Color(0xff333333),
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff999999),
                                  size: 14,
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _dialog();
                          },
                          child: Container(
                            width: 360.w,
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
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/info5.png",
                                      width: 20.w,
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      "注销账号",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Color(0xff333333),
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff999999),
                                  size: 14,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10.w,
                child: SafeArea(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    width: 375.w,
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
                          "软件设置",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Color(0xffffffff),
                          ),
                        ),
                        Container(
                          width: 30.w,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  _dialog() {
    showDialog(
      context: Get.context!,
      builder: (ctx) {
        return Center(
          child: Container(
            width: 300.w,
            height: 160.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 15.w),
                Text(
                  "注销账号",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Color(0xff333333),
                  ),
                ),
                SizedBox(height: 15.w),
                Text(
                  "是否确定注销此账号\n注销之后将所有的数据",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xff666666),
                  ),
                ),
                Expanded(child: Container()),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: 150.w,
                        height: 50.w,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Color(0xff999999).withOpacity(.1),
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "取消",
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Color(0xff333333),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: 150.w,
                        height: 50.w,
                        decoration: BoxDecoration(
                          color: Color(0xff5DB1FB),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "确定",
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
