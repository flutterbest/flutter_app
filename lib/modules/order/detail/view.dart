import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_quick/constants/colors.dart';
import 'package:flutter_quick/events.dart';
import 'package:flutter_quick/repository/order_repository.dart';
import 'package:flutter_quick/routes/routes.dart';
import 'package:flutter_quick/utils/helper.dart';
import 'package:flutter_quick/utils/map.dart';
import 'package:flutter_quick/widgets/buttons/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../repository/user_repository.dart';
import 'logic.dart';
import 'state.dart';

class OrderDetailPage extends StatelessWidget {
  final OrderDetailLogic logic = Get.put(OrderDetailLogic());
  final OrderDetailState state = Get.find<OrderDetailLogic>().state;

  OrderDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailLogic>(
      builder: (l) {
        return Scaffold(
          backgroundColor: Color(0xfff5f5f5),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              "进行中",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          bottomNavigationBar: Container(
            child: getButton(l.state.data),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xffE9E9E9),
                  width: 1,
                ),
              ),
            ),
          ),
          body: l.state.data == null
              ? Container()
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildStepWidget(),
                        _buildGoodsInfoWidget(),
                        // _buildTimerWidget(),
                        _buildUserInfoWidget(),
                        _buildServiceInfoWidget(),
                        _buildOrderInfoWidget(),
                        _buildRemarkInfoWidget(),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }

  /// 1
  Widget _buildStepWidget() {
    // 订单状态 0：未开始 1：待接单 2：正在进行 3：已完成 4：已评价 5：售后中 6：已取消
    int status = state.data!["subStatus"] ?? 0;

    int step = 0;
    if (status == 0 || status == 1) {
      step = 0;
    }
    // 接单
    if (status == 9) {
      step = 1;
    }
    // 出发
    if (status == 2) {
      step = 2;
    }
    // 到达
    if (status == 3) {
      step = 3;
    }
    // 工作
    if (status == 4) {
      step = 4;
    }
    // 完成
    if (status == 5) {
      step = 5;
    }

    ///
    if (status == 6 || status == 7 || status == 8) {
      step = 4;
    }

    return Container(
      padding: EdgeInsets.all(15.w),
      margin: EdgeInsets.only(top: 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Image.asset(
                "assets/images/step${step >= 1 ? '' : '0'}.png",
                width: 24.w,
                height: 24.w,
              ),
              SizedBox(height: 10.w),
              Text(
                "接单",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: step > 1 ? ColorConstants.appColor : Color(0xff434343),
                ),
              )
            ],
          ),
          Container(
            width: 23.w,
            height: 2.w,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            color: step >= 1 ? ColorConstants.appColor : Color(0xffd8d8d8),
          ),
          Column(
            children: [
              Image.asset(
                "assets/images/step${step >= 2 ? '' : '0'}.png",
                width: 24.w,
                height: 24.w,
              ),
              SizedBox(height: 10.w),
              Text(
                "出发",
                style: TextStyle(
                  fontSize: 12.sp,
                  color:
                      step >= 2 ? ColorConstants.appColor : Color(0xff434343),
                ),
              )
            ],
          ),
          Container(
            width: 23.w,
            height: 2.w,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            color: step >= 2 ? ColorConstants.appColor : Color(0xffd8d8d8),
          ),
          Column(
            children: [
              Image.asset(
                "assets/images/step${step >= 3 ? '' : '0'}.png",
                width: 24.w,
                height: 24.w,
              ),
              SizedBox(height: 10.w),
              Text(
                "到达",
                style: TextStyle(
                  fontSize: 12.sp,
                  color:
                      step >= 3 ? ColorConstants.appColor : Color(0xff434343),
                ),
              )
            ],
          ),
          Container(
            width: 23.w,
            height: 2.w,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            color: step >= 3 ? ColorConstants.appColor : Color(0xffd8d8d8),
          ),
          Column(
            children: [
              Image.asset(
                "assets/images/step${step >= 4 ? '' : '0'}.png",
                width: 24.w,
                height: 24.w,
              ),
              SizedBox(height: 10.w),
              Text(
                "工作",
                style: TextStyle(
                  fontSize: 12.sp,
                  color:
                      step >= 4 ? ColorConstants.appColor : Color(0xff434343),
                ),
              )
            ],
          ),
          Container(
            width: 23.w,
            height: 2.w,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            color: step >= 4 ? ColorConstants.appColor : Color(0xffd8d8d8),
          ),
          Column(
            children: [
              Image.asset(
                "assets/images/step${step >= 5 ? '' : '0'}.png",
                width: 24.w,
                height: 24.w,
              ),
              SizedBox(height: 10.w),
              Text(
                "完成",
                style: TextStyle(
                  fontSize: 12.sp,
                  color:
                      step >= 5 ? ColorConstants.appColor : Color(0xff434343),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  /// 2
  Widget _buildGoodsInfoWidget() {
    return Container(
      padding: EdgeInsets.all(15.w),
      margin: EdgeInsets.only(top: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Column(
        children: [
          Row(
            children: [
              if (state.data!['project'] != null &&
                  state.data!['project']['coverImg'] != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.w),
                  child: Image.network(
                    "${state.data!['project']['coverImg']}",
                    width: 103.w,
                    height: 103.w,
                    errorBuilder: (a, b, c) {
                      return Image.asset(
                        "assets/images/logo.png",
                        width: 103.w,
                        height: 103.w,
                      );
                    },
                  ),
                ),
              SizedBox(width: 15.w),
              if (state.data!['project'] != null)
                Expanded(
                  child: Container(
                    height: 103.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${state.data!['project']['projectName']}",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "￥${state.data!['project']['projectTotalPrice']}",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffff8400),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/clock.png",
                              width: 18.w,
                              height: 18.w,
                            ),
                            SizedBox(width: 5.w),
                            Expanded(
                              child: Text(
                                "${state.data!['project']['projectTime']}分钟    x${state.data!['project']['num']}",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xff515151),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                        Text(
                          "${state.data!['project']['introduction']}",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xff515151),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
          SizedBox(height: 15.w),
        ],
      ),
    );
  }

  /// 倒计时
  // Widget _buildTimerWidget() {
  //   if (!state.showTimer || state.duration == null) return Container();
  //   return Container(
  //     padding: EdgeInsets.all(15.w),
  //     margin: EdgeInsets.only(top: 15.w),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(8.w),
  //     ),
  //     child: Row(
  //       children: [
  //         Text(
  //           "服务计时: ",
  //           style: TextStyle(
  //             fontSize: 14.sp,
  //             color: Colors.black,
  //           ),
  //         ),
  //         Text(
  //           logic.getTime(),
  //           style: TextStyle(
  //             fontSize: 30.sp,
  //             color: ColorConstants.appColor,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  /// 用户信息
  Widget _buildUserInfoWidget() {
    return Container(
      padding: EdgeInsets.all(15.w),
      margin: EdgeInsets.only(top: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "用户信息",
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.w),
          Container(
            margin: EdgeInsets.only(bottom: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "联系人",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff898989),
                  ),
                ),
                Text(
                  "${state.data!['appointment']['contactPerson']}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "联系电话",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff898989),
                  ),
                ),
                Text(
                  "${state.data!['appointment']['contactPhone']}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "预约时间",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff898989),
                  ),
                ),
                Text(
                  "${state.data!['appointment']['appointmentTime']}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "服务地址",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff898989),
                  ),
                ),
                Text(
                  "${state.data!['appointment']['serviceAddress']}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                    useSafeArea: false,
                    context: Get.context!,
                    builder: (ctx) {
                      return Scaffold(
                        backgroundColor: Colors.black.withOpacity(.6),
                        body: Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Container(
                              width: 376.w,
                              height: 270.w,
                              padding: EdgeInsets.all(15.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.w),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        width: 24.w,
                                        child: Image.asset(
                                          "assets/images/close.png",
                                          width: 15.w,
                                          height: 15.w,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.w),
                                  Text(
                                    "确认即开此页面，前往地图导航",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10.w),
                                  AppButton(
                                    title: "高德地图",
                                    width: 323.w,
                                    height: 50.w,
                                    onTap: () async {
                                      List latlng =
                                          state.data!['point']['coordinates'];
                                      MapUtils.openAmap(latlng[1], latlng[0]);
                                    },
                                  ),
                                  SizedBox(height: 10.w),
                                  AppButton(
                                    title: "百度地图",
                                    width: 323.w,
                                    height: 50.w,
                                    onTap: () async {
                                      List latlng =
                                          state.data!['point']['coordinates'];
                                      MapUtils.openBaiduMap(
                                          latlng[1], latlng[0]);
                                    },
                                  ),
                                  SizedBox(height: 20.w),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: 176.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    color: Color(0xff007BFF),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/location.png",
                          width: 26.w,
                          height: 26.w,
                          color: Colors.white,
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          "地址导航",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  var phone = "${state.data!['appointment']['contactPhone']}";

                  var url = Uri(scheme: "tel", path: phone);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Container(
                  width: 176.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    color: ColorConstants.appColor,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/contact.png",
                          width: 26.w,
                          height: 26.w,
                          color: Colors.white,
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          "联系用户",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  /// 服务信息
  Widget _buildServiceInfoWidget() {
    return Container(
      padding: EdgeInsets.all(15.w),
      margin: EdgeInsets.only(top: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "服务信息",
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.w),
          Container(
            margin: EdgeInsets.only(bottom: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "项目金额",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff898989),
                  ),
                ),
                Text(
                  "￥${state.data!['service']['projectAmount'] ?? 0}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "会员减免",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff898989),
                  ),
                ),
                Text(
                  "-￥${state.data!['service']['memberDiscount'] ?? 0}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "交通费用",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff898989),
                  ),
                ),
                Text(
                  "￥${state.data!['service']['travelCost'] ?? 0}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "加钟费用",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff898989),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.amountList,
                        arguments: state.data!['orderId']);
                  },
                  child: Row(
                    children: [
                      Text(
                        "￥${state.data!['service']['addBellCost'] ?? 0}",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: Color(0xff898989),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "退款金额",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff898989),
                  ),
                ),
                Text(
                  "￥${state.data!['service']['refundAmount'] ?? 0}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "实收金额",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff898989),
                  ),
                ),
                Text(
                  "￥${state.data!['service']['receivedAmount'] ?? 0}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "技师收入",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff898989),
                  ),
                ),
                Text(
                  "￥${state.data!['service']['artificerIncome'] ?? 0}",
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: ColorConstants.appColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 订单信息
  Widget _buildOrderInfoWidget() {
    return Container(
      padding: EdgeInsets.all(15.w),
      margin: EdgeInsets.only(top: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "订单信息",
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.w),
          Container(
            margin: EdgeInsets.only(bottom: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "订单号",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff898989),
                  ),
                ),
                Text(
                  "${state.data!['order'] == null ? '' : state.data!['order']['orderNo']}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "支付方式",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff898989),
                  ),
                ),
                Text(
                  "${state.data!['order'] == null ? '' : state.data!['order']['paymentWay'] == 0 ? '微信支付' : '支付宝支付'}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "下单时间",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff898989),
                  ),
                ),
                Text(
                  "${state.data!['order'] == null ? '' : state.data!['order']['orderTime']}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 备注信息
  Widget _buildRemarkInfoWidget() {
    return Container(
      padding: EdgeInsets.all(15.w),
      margin: EdgeInsets.only(top: 15, bottom: 30.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "备注",
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.w),
          Text(
            "${state.data!['remark'] ?? '无'}",
            style: TextStyle(
              fontSize: 16.sp,
              color: Color(0xff898989),
            ),
          ),
        ],
      ),
    );
  }

  Widget? getButton(dynamic data) {
    if (data == null) return null;

    // 未接单
    if (data["status"] == 0) {
      return GestureDetector(
        onTap: () {
          showDialog(
            context: Get.context!,
            builder: (context) {
              return AlertDialog(
                title: Text("提示"),
                content: Text("是否确认接单?"),
                actions: <Widget>[
                  TextButton(
                    child: Text("取消"),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  TextButton(
                    child: Text("确认"),
                    onPressed: () {
                      Get.back();
                      UserRepository.immediatelyOrder(data['orderId'])
                          .then((value) {
                        logic.onInit();
                      });
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          height: 50.w,
          color: ColorConstants.appColor,
          child: Center(
            child: Text(
              "立即接单",
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    } else if (data["status"] == 1) {
      // 立即出发
      if (data['subStatus'] == 9) {
        return GestureDetector(
          onTap: () {
            showDialog(
              context: Get.context!,
              builder: (context) {
                return AlertDialog(
                  title: Text("提示"),
                  content: Text("是否确认立即出发?"),
                  actions: <Widget>[
                    TextButton(
                      child: Text("取消"),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    TextButton(
                      child: Text("确认"),
                      onPressed: () {
                        Get.back();
                        UserRepository.immediatelyDeparture(data['orderId'])
                            .then((value) {
                          logic.onInit();
                        });
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
            height: 50.w,
            color: ColorConstants.appColor,
            child: Center(
              child: Text(
                "立即出发",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }
      // 已到达预约地址
      if (data['subStatus'] == 2) {
        return GestureDetector(
          onTap: () {
            showDialog(
              context: Get.context!,
              builder: (context) {
                return AlertDialog(
                  title: Text("提示"),
                  content: Text("是否确认到达预约地址?"),
                  actions: <Widget>[
                    TextButton(
                      child: Text("取消"),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    TextButton(
                      child: Text("确认"),
                      onPressed: () {
                        Get.back();
                        UserRepository.immediatelyArrive(data['orderId'])
                            .then((value) {
                          logic.onInit();
                        });
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
            height: 50.w,
            color: Color(0xff09BB07),
            child: Center(
              child: Text(
                "已到达预约地址",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }
      // 开始工作
      if (data['subStatus'] == 3) {
        return GestureDetector(
          onTap: () {
            showDialog(
              context: Get.context!,
              builder: (context) {
                return AlertDialog(
                  title: Text("提示"),
                  content: Text("是否确认开始工作?"),
                  actions: <Widget>[
                    TextButton(
                      child: Text("取消"),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    TextButton(
                      child: Text("确认"),
                      onPressed: () {
                        Get.back();
                        UserRepository.immediatelyWork(data['orderId'])
                            .then((value) {
                          logic.onInit();
                        });
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
            height: 50.w,
            color: ColorConstants.appColor,
            child: Center(
              child: Text(
                "开始工作",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }

      // 工作完成
      if (data['subStatus'] == 4) {
        return Container(
          width: double.infinity,
          color: Colors.red,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                    useSafeArea: false,
                    context: Get.context!,
                    builder: (ctx) {
                      return Container(
                        color: Colors.black.withOpacity(.8),
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: AddTimeDialog(orderId: state.data!['orderId']),
                      );
                    },
                  );
                },
                child: Container(
                  width: 138.w,
                  height: 50.w,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      "加钟",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: Get.context!,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("提示"),
                        content: Text("是否确认完成工作?"),
                        actions: <Widget>[
                          TextButton(
                            child: Text("取消"),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          TextButton(
                            child: Text("确认"),
                            onPressed: () {
                              Get.back();
                              UserRepository.immediatelyFinish(data['orderId'])
                                  .then((value) {
                                logic.onInit();
                              });
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  width: 290.w,
                  height: 50.w,
                  color: Color(0xff09BB07),
                  child: Center(
                    child: Text(
                      "工作完成",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    } else {
      return Container(height: 1, width: double.infinity);
    }

    return Container(height: 1, width: double.infinity);
  }
}

class AddTimeDialog extends StatefulWidget {
  final dynamic orderId;
  AddTimeDialog({Key? key, required this.orderId}) : super(key: key);

  @override
  _AddTimeState createState() => _AddTimeState();
}

class _AddTimeState extends State<AddTimeDialog> {
  /// 0 微信 1支付宝
  ///
  int payType = 0;

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 376.w,
          height: 427.w,
          padding: EdgeInsets.all(15.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.w),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 24.w,
                    child: Image.asset(
                      "assets/images/close.png",
                      width: 15.w,
                      height: 15.w,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.w),
              Text(
                "服务加钟收费",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 323.w,
                height: 50.w,
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                margin: EdgeInsets.only(bottom: 20.w, top: 20.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorConstants.borderColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: TextField(
                    controller: controller,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.sp,
                    ),
                    cursorColor: ColorConstants.appColor,
                    textAlign: TextAlign.left,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: '请输入加钟金额',
                      hintStyle: TextStyle(
                        color: const Color(0xff8b5b5b5),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              AppButton(
                title: "确认收费",
                width: 323.w,
                height: 50.w,
                onTap: () {
                  if (controller.text.isEmpty) {
                    toast("请输入加钟金额");
                    return;
                  }
                  EasyLoading.show();
                  var params = {
                    "addBellAmount": controller.text,
                    "orderId": widget.orderId,
                    "paymentMethod": payType,
                  };
                  OrderRepository.addBellCharge(params).then((value) {
                    if (value != null) {
                      Get.offAndToNamed(Routes.orderPayment, arguments: value)
                          ?.then(
                        (value) {
                          eventBus.fire(UpdateDetailEvent());
                        },
                      );
                    }
                  });
                },
              ),
              SizedBox(height: 25.w),
              Row(
                children: [
                  Image.asset(
                    "assets/images/warning.png",
                    width: 20.w,
                    height: 20.w,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    "请确认金额，加钟服务只限一次",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xffFF8400),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.w),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "请选择支付方式",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15.w),
              GestureDetector(
                onTap: () {
                  setState(() {
                    payType = 0;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/wechat.png",
                          width: 40.w,
                          height: 40.w,
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          "微信支付",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/images/${payType == 0 ? 'check' : 'uncheck'}.png",
                      width: 24.w,
                      height: 24.w,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.w),
              GestureDetector(
                onTap: () {
                  setState(() {
                    payType = 1;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/alipay.png",
                          width: 40.w,
                          height: 40.w,
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          "支付宝支付",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/images/${payType == 1 ? 'check' : 'uncheck'}.png",
                      width: 24.w,
                      height: 24.w,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
