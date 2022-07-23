import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants/colors.dart';
import 'logic.dart';
import 'state.dart';

class TimePage extends StatelessWidget {
  final TimeLogic logic = Get.put(TimeLogic());
  final TimeState state = Get.find<TimeLogic>().state;

  TimePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TimeLogic>(
      builder: (logic) {
        var children = [
          _button("全选", select: state.selectAll),
        ];

        // 添加按钮到数组

        for (int i = 0; i < state.dateTimeList.length; i++) {
          children.add(
            _button(
              DateFormat("HH:mm").format(state.dateTimeList[i]),
              disable: state.appointmentTimes.contains(state.dateTimeList[i]),
              select: state.selectTime.contains(state.dateTimeList[i]),
              dateTime: state.dateTimeList[i],
            ),
          );
        }
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Color(0xffffffff),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
              title: Text(
                "时间",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: logic.submit,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Center(
                      child: Text(
                        "保存",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )
              ],
              bottom: TabBar(
                controller: state.tabController,
                indicatorColor: ColorConstants.appColor,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 60.w),
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
                onTap: (i) {
                  state.currentTab = i;
                  logic.init();
                  logic.update();
                },
                tabs: state.tabs.map((e) => Tab(text: e)).toList(),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                margin: EdgeInsets.symmetric(vertical: 15.w),
                child: Wrap(
                  runSpacing: 15.w,
                  spacing: 4.w,
                  children: children,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _button(
    String title, {
    bool disable = false,
    bool select = false,
    DateTime? dateTime,
  }) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            if (disable) return;
            //从数组添加或者删除时间
            if (dateTime != null) {
              /// 不重新赋值会有异常
              List<DateTime> tmp = [];
              state.selectTime.forEach((element) {
                tmp.add(element);
              });
              if (tmp.contains(dateTime)) {
                tmp.remove(dateTime);
                state.selectAll = false;
              } else {
                tmp.add(dateTime);
              }
              state.selectTime = tmp;
              logic.update();
            }
            //全选和取消全选
            if (dateTime == null) {
              if (state.selectAll) {
                state.selectAll = false;
                state.selectTime = [];
              } else {
                state.selectAll = true;
                state.selectTime = state.dateTimeList;
              }
              logic.update();
            }
          },
          child: Container(
            width: 90.w,
            height: 40.w,
            margin: EdgeInsets.only(top: 9.w, right: 5.w),
            decoration: BoxDecoration(
              color: select && !disable
                  ? ColorConstants.appColor
                  : Color(0xfff5f5f5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: select && !disable ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
        if (disable)
          Positioned(
            right: 0,
            child: Container(
              width: 56.w,
              height: 18.w,
              decoration: BoxDecoration(
                color: Color(0xff1dd66c),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                ),
              ),
              child: Center(
                child: Text(
                  "已预约",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
      ],
    );
  }
}
