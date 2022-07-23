import 'package:flutter/material.dart';
import 'package:flutter_quick/repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../events.dart';
import '../../../utils/helper.dart';
import 'state.dart';

class TimeLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final state = TimeState();

  @override
  void onInit() {
    super.onInit();

    eventBus.on<UpdateTabEvent>().listen((event) {
      if (event.tab == 1) {
        init();
      }
    });

    state.tabController = TabController(length: 3, vsync: this);
    state.tabController.addListener(() {
      if (!state.tabController.indexIsChanging) {
        state.currentTab = state.tabController.index;
      }
    });

    if (!app().state.isLogin) return;
    init();
  }

  @override
  void onReady() {
    super.onReady();
  }

  init() {
    UserRepository.appointmentList().then((value) {
      if (value != null) {
        List data = value;
        List<DateTime> tmp2 = [];

        for (int i = 0; i < data.length; i++) {
          var element = data[i];
          // 休息时间段  restTime
          List restTime = (element['restTime'] ?? '').toString().split(",");
          // 预约时间段  appointmentTime
          List appointmentTime =
              (element['appointmentTime'] ?? '').toString().split(",");

          List<DateTime> tmp1 = [];
          if (restTime.isNotEmpty) {
            restTime.forEach((e) {
              if (e.toString().contains(":")) {
                var tmp = DateTime.parse("${element['wordDate']} ${e}:00");
                tmp1.add(tmp);
              }
            });
          }
          if (appointmentTime.isNotEmpty) {
            appointmentTime.forEach((e) {
              if (e.toString().contains(":")) {
                var tmp = DateTime.parse("${element['wordDate']} ${e}:00");
                tmp2.add(tmp);
              }
            });
          }

          if (i == 0) {
            state.selectTime1 = tmp1;
          }
          if (i == 1) {
            state.selectTime2 = tmp1;
          }
          if (i == 2) {
            state.selectTime3 = tmp1;
          }
        }

        // tmp2.add(DateTime.parse("2022-07-15 20:00:00"));
        state.appointmentTimes = tmp2;

        update();
      }
    });

    /// 当前时间
    var now = DateTime.now();

    ///  开始日期
    var start = DateTime.parse(DateFormat("yyyy-MM-dd 00:00:00").format(now));
    var tomorrow = start.add(Duration(days: 1));
    var afterTomorrow = start.add(Duration(days: 2));
    // 清空之前数据
    state.dateTimeList1 = [];
    state.dateTimeList2 = [];
    state.dateTimeList3 = [];

    /// 今天 设置时间数组 00:00 - 23:30
    List<DateTime> tmp1 = [];
    for (int i = 0; i < 48; i++) {
      var dateTime = start.add(Duration(minutes: i * 30));
      if (now.difference(dateTime).inSeconds < 0) {
        tmp1.add(dateTime);
      }
    }
    state.dateTimeList1 = tmp1;

    // 明天
    List<DateTime> tmp2 = [];

    for (int i = 0; i < 48; i++) {
      var dateTime = tomorrow.add(Duration(minutes: i * 30));
      tmp2.add(dateTime);
    }
    state.dateTimeList2 = tmp2;

    // 后天
    List<DateTime> tmp3 = [];

    for (int i = 0; i < 48; i++) {
      var dateTime = afterTomorrow.add(Duration(minutes: i * 30));
      tmp3.add(dateTime);
    }
    state.dateTimeList3 = tmp3;

    /// 设置tabs
    state.tabs = [
      DateFormat("MM-dd").format(start),
      DateFormat("MM-dd").format(tomorrow),
      DateFormat("MM-dd").format(afterTomorrow),
    ];

    update();
  }

  submit() {
    var params = {};
    List<String> times = [];

    state.selectTime.forEach((element) {
      times.add(DateFormat("HH:mm").format(element));
    });

    DateTime date = DateTime.now();

    if (state.currentTab == 1) {
      date = date.add(Duration(days: 1));
    }
    if (state.currentTab == 2) {
      date = date.add(Duration(days: 2));
    }

    params = {
      "artificerId": app().state.user!.id,
      "time": times,
      "daydate": DateFormat("yyyy-MM-dd").format(date),
    };

    UserRepository.operationTime(params).then((value) {
      if (value != null) {
        init();
      }
    });
  }
}
