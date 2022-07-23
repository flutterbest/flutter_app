import 'package:flutter/material.dart';
import 'package:flutter_quick/constants/colors.dart';
import 'package:flutter_quick/repository/user_repository.dart';
import 'package:flutter_quick/routes/routes.dart';
import 'package:flutter_quick/widgets/buttons/app_button.dart';
import 'package:flutter_quick/widgets/refresh_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class OrderPage extends StatelessWidget {
  final OrderLogic logic = Get.put(OrderLogic());
  final OrderState state = Get.find<OrderLogic>().state;

  OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderLogic>(
      builder: (_) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor: Color(0xfff5f5f5),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                "订单",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.setting);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Image.asset(
                      "assets/images/setting.png",
                      width: 24.w,
                      height: 24.w,
                    ),
                  ),
                )
              ],
              bottom: TabBar(
                controller: state.tabController,
                indicatorColor: ColorConstants.appColor,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 30.w),
                labelStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                labelColor: ColorConstants.appColor,
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                onTap: (index) {
                  if (index == 0) {
                    state.status = 0;
                  }
                  if (index == 1) {
                    state.status = 1;
                  }
                  if (index == 2) {
                    state.status = 2;
                  }
                  if (index == 3) {
                    state.status = 3;
                  }
                  logic.list.clear();
                  logic.update();
                  logic.refreshData(init: true);
                },
                tabs: [
                  Tab(text: '待接单'),
                  Tab(text: '进行中'),
                  Tab(text: '已取消'),
                  Tab(text: '已完成'),
                ],
              ),
            ),
            body: RefreshWidget(
              controller: logic,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                itemBuilder: (context, index) {
                  return _buildListItem(logic.list[index]);
                },
                itemCount: logic.list.length,
              ),
            ),
          ),
        );
      },
    );
  }

  /// listview
  Widget _buildListItem(dynamic data) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.orderDetail, arguments: data["orderId"]);
        // Get.toNamed(Routes.orderDetail, arguments: 61);
      },
      child: Container(
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.w),
                  child: Image.network(
                    "${data['coverImg']}",
                    width: 87.w,
                    height: 87.w,
                    errorBuilder: (ctx, obj, trace) {
                      return Image.asset(
                        "assets/images/logo.png",
                        width: 87.w,
                        height: 87.w,
                      );
                    },
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: Container(
                    height: 80.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${data['projectName']}",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              getStatusName(data["status"]),
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: ColorConstants.appColor,
                              ),
                            )
                          ],
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
                                "预约时间：${data['appointmentTime']}",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/location.png",
                              width: 18.w,
                              height: 18.w,
                            ),
                            SizedBox(width: 5.w),
                            Expanded(
                              child: Text(
                                "${data['appointmentAddress']}",
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
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 15.w),
            getButton(data),
          ],
        ),
      ),
    );
  }

  Widget getButton(dynamic data) {
    // 未接单
    if (data["status"] == 0) {
      return AppButton(
        title: "立即接单",
        width: 366.w,
        height: 50.w,
        fontSize: 16.sp,
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
                        logic.refreshData(init: true);
                      });
                    },
                  ),
                ],
              );
            },
          );
        },
      );
    } else if (data["status"] == 1) {
      // 立即出发
      if (data['subStatus'] == 9) {
        return AppButton(
          title: "立即出发",
          width: 366.w,
          height: 50.w,
          fontSize: 16.sp,
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
                          logic.refreshData(init: true);
                        });
                      },
                    ),
                  ],
                );
              },
            );
          },
        );
      }
      // 已到达预约地址
      if (data['subStatus'] == 2) {
        return AppButton(
          title: "已到达预约地址",
          width: 366.w,
          height: 50.w,
          bgColor: Color(0xff09BB07),
          fontSize: 16.sp,
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
                          logic.refreshData(init: true);
                        });
                      },
                    ),
                  ],
                );
              },
            );
          },
        );
      }
      // 开始工作
      if (data['subStatus'] == 3) {
        return AppButton(
          title: "开始工作",
          width: 366.w,
          height: 50.w,
          fontSize: 16.sp,
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
                          logic.refreshData(init: true);
                        });
                      },
                    ),
                  ],
                );
              },
            );
          },
        );
      }

      // 工作完成
      if (data['subStatus'] == 4) {
        return AppButton(
          title: "工作完成",
          width: 366.w,
          height: 50.w,
          bgColor: Color(0xff09BB07),
          fontSize: 16.sp,
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
                          logic.refreshData(init: true);
                        });
                      },
                    ),
                  ],
                );
              },
            );
          },
        );
      }
    } else {
      return Container();
    }

    return Container();
  }

  String getStatusName(int status) {
    if (status == 0) {
      return "待接单";
    }
    if (status == 1) {
      return "进行中";
    }
    if (status == 2) {
      return "已取消";
    }
    if (status == 3) {
      return "已完成";
    }
    if (status == 4) {
      return "售后中";
    }

    return "$status";
  }
}
