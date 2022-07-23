import 'package:flutter/material.dart';
import 'package:flutter_quick/constants/colors.dart';
import 'package:flutter_quick/utils/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../routes/routes.dart';
import 'logic.dart';
import 'state.dart';

class MyPage extends StatelessWidget {
  final MyLogic logic = Get.put(MyLogic());
  final MyState state = Get.find<MyLogic>().state;

  MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorConstants.appColor,
        elevation: 0,
        title: Text(
          "我的",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Get.toNamed(Routes.setting)
                  ?.then((value) => logic.updateUserInfo());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Image.asset(
                "assets/images/setting.png",
                width: 24.w,
                height: 24.w,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: GetBuilder<MyLogic>(
        builder: (logic) {
          return state.userInfo == null
              ? Container()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      /// 用户信息
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            width: 428.w,
                            height: 150.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/user_bg.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            width: 396.w,
                            height: 163.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 15.w,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        Get.toNamed(Routes.avatar)?.then(
                                            (value) => logic.updateUserInfo());
                                      },
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              ClipOval(
                                                child: state.userInfo![
                                                            "avatar"] ==
                                                        null
                                                    ? Image.asset(
                                                        "assets/images/logo.png",
                                                        width: 61.w,
                                                        height: 61.w,
                                                        fit: BoxFit.fitWidth,
                                                      )
                                                    : Image.network(
                                                        state.userInfo![
                                                            "avatar"],
                                                        width: 61.w,
                                                        height: 61.w,
                                                        fit: BoxFit.cover,
                                                        errorBuilder:
                                                            (ctx, obj, trace) {
                                                          return Image.asset(
                                                            "assets/images/logo.png",
                                                            width: 61.w,
                                                            height: 61.w,
                                                          );
                                                        },
                                                      ),
                                              ),
                                              SizedBox(height: 8.5.w),
                                            ],
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            child: Image.asset(
                                              "assets/images/add1.png",
                                              width: 17.w,
                                              height: 17.w,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 16.w),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    state.userInfo![
                                                        "artificerName"],
                                                    style: TextStyle(
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 56.w,
                                                    height: 18.w,
                                                    margin: EdgeInsets.only(
                                                        left: 15.w),
                                                    decoration: BoxDecoration(
                                                      color: state.userInfo![
                                                                  "serviceStatus"] ==
                                                              0
                                                          ? Color(0xff1dd66c)
                                                          : ColorConstants
                                                              .appColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(
                                                                100),
                                                        bottomRight:
                                                            Radius.circular(
                                                                100),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                100),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        state.userInfo![
                                                                    "serviceStatus"] ==
                                                                0
                                                            ? "可服务"
                                                            : "忙碌中",
                                                        style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                width: 49.w,
                                                height: 18.w,
                                                margin:
                                                    EdgeInsets.only(left: 15.w),
                                                decoration: BoxDecoration(
                                                  color: state.userInfo![
                                                              "status"] ==
                                                          1
                                                      ? Color(0xff1dd66c)
                                                      : ColorConstants.appColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ClipOval(
                                                      child: Container(
                                                        width: 6.w,
                                                        height: 6.w,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    SizedBox(width: 3.w),
                                                    Text(
                                                      state.userInfo![
                                                                  "status"] ==
                                                              1
                                                          ? "上线"
                                                          : "下线",
                                                      style: TextStyle(
                                                        fontSize: 12.sp,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 10.w),
                                          Text(
                                            "ID：${state.userInfo!["idNO"]}",
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Color(0XFF535353),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "${state.userInfo!["orderVolume"]}",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 5.w),
                                        Text(
                                          "接单量",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "${state.userInfo!["clockRate"]}%",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 5.w),
                                        Text(
                                          "加钟率",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "${state.userInfo!["favorableRate"]}%",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 5.w),
                                        Text(
                                          "好评率",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "${state.userInfo!["refundRate"]}%",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 5.w),
                                        Text(
                                          "退款率",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "${state.userInfo!["fans"]}",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 5.w),
                                        Text(
                                          "粉丝数",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),

                      /// 余额
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Get.toNamed(Routes.wallet)
                              ?.then((value) => logic.updateUserInfo());
                        },
                        child: Container(
                          width: 396.w,
                          height: 75.w,
                          margin: EdgeInsets.only(top: 10.w),
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          decoration: BoxDecoration(
                            color: ColorConstants.appColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${state.userInfo!["balance"] ?? 0}",
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "当前余额",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// 个人资料
                      Container(
                        width: 396.w,
                        margin: EdgeInsets.only(top: 10.w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 15.w,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "个人资料",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 11.w),
                                Text(
                                  "请完成以下资料认证才能成为技师",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Color(0xffff8400),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 25.w),
                            Stack(
                              children: [
                                Wrap(
                                  spacing: 60.w,
                                  runSpacing: 30.w,
                                  alignment: WrapAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        Get.toNamed(Routes.certificate)?.then(
                                            (value) => logic.updateUserInfo());
                                      },
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/menu1.png",
                                            width: 40.w,
                                            height: 40.w,
                                          ),
                                          SizedBox(height: 10.w),
                                          Text(
                                            "证件资料",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        Get.toNamed(Routes.introduce)?.then(
                                            (value) => logic.updateUserInfo());
                                      },
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/menu2.png",
                                            width: 40.w,
                                            height: 40.w,
                                          ),
                                          SizedBox(height: 10.w),
                                          Text(
                                            "个人展示",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        Get.toNamed(Routes.comment)?.then(
                                            (value) => logic.updateUserInfo());
                                      },
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/menu3.png",
                                            width: 40.w,
                                            height: 40.w,
                                          ),
                                          SizedBox(height: 10.w),
                                          Text(
                                            "我的评价",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        Get.toNamed(Routes.address)?.then(
                                            (value) => logic.updateUserInfo());
                                      },
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/menu4.png",
                                            width: 40.w,
                                            height: 40.w,
                                          ),
                                          SizedBox(height: 10.w),
                                          Text(
                                            "常用地址",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        Get.toNamed(Routes.tag)?.then(
                                            (value) => logic.updateUserInfo());
                                      },
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/menu5.png",
                                            width: 40.w,
                                            height: 40.w,
                                          ),
                                          SizedBox(height: 10.w),
                                          Text(
                                            "个人标签",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () async {
                                        [
                                          Permission.location,
                                        ].request();

                                        bool isGranted =
                                            await Permission.location.isGranted;

                                        logger(await Permission
                                            .location.serviceStatus);

                                        if (!isGranted) {
                                          showDialog(
                                            context: Get.context!,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text("提示"),
                                                content: Text("应用需要您的同意才能定位数据"),
                                                actionsAlignment:
                                                    MainAxisAlignment.end,
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: Text("取消"),
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: Text("确定"),
                                                    onPressed: () async {
                                                      Get.back();
                                                      if (await Permission
                                                          .location.isDenied) {
                                                        openAppSettings();
                                                      }
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          return;
                                        }
                                        Get.toNamed(Routes.serviceArea)?.then(
                                            (value) => logic.updateUserInfo());
                                      },
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/menu6.png",
                                            width: 40.w,
                                            height: 40.w,
                                          ),
                                          SizedBox(height: 10.w),
                                          Text(
                                            "服务区域",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                if (state.userInfo!["isCertified"] == 1)
                                  Positioned(
                                    left: 40.w,
                                    child: Container(
                                      width: 56.w,
                                      height: 18.w,
                                      margin: EdgeInsets.only(left: 15.w),
                                      decoration: BoxDecoration(
                                        color: ColorConstants.appColor,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(100),
                                          bottomRight: Radius.circular(100),
                                          bottomLeft: Radius.circular(100),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "已审核",
                                          style: TextStyle(
                                            fontSize: 12.sp,
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
                    ],
                  ),
                );
        },
      ),
    );
  }
}
