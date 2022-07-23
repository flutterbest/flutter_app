import 'package:flutter/material.dart';

class TimeState {
  int currentTab = 0;

  late TabController tabController;
  List<String> tabs = ["", "", ""];
  // 全选
  bool _selectAll1 = false;
  bool _selectAll2 = false;
  bool _selectAll3 = false;

  bool get selectAll {
    if (currentTab == 0) {
      return _selectAll1;
    }
    if (currentTab == 1) {
      return _selectAll2;
    }
    if (currentTab == 2) {
      return _selectAll3;
    }
    return _selectAll1;
  }

  set selectAll(bool v) {
    if (currentTab == 0) {
      _selectAll1 = v;
    }
    if (currentTab == 1) {
      _selectAll2 = v;
    }
    if (currentTab == 2) {
      _selectAll3 = v;
    }
  }

  /// 时间
  List<DateTime> _dateTimeList1 = [];
  List<DateTime> _dateTimeList2 = [];
  List<DateTime> _dateTimeList3 = [];

  set dateTimeList1(List<DateTime> v) {
    _dateTimeList1 = v;
  }

  set dateTimeList2(List<DateTime> v) {
    _dateTimeList2 = v;
  }

  set dateTimeList3(List<DateTime> v) {
    _dateTimeList3 = v;
  }

  List<DateTime> get dateTimeList {
    if (currentTab == 1) {
      return _dateTimeList2;
    }
    if (currentTab == 2) {
      return _dateTimeList3;
    }
    return _dateTimeList1;
  }

  /// 选择的时间
  List<DateTime> _selectTime1 = [];
  List<DateTime> _selectTime2 = [];
  List<DateTime> _selectTime3 = [];

  List<DateTime> get selectTime {
    if (currentTab == 1) {
      return _selectTime2;
    }
    if (currentTab == 2) {
      return _selectTime3;
    }
    return _selectTime1;
  }

  set selectTime1(List<DateTime> v) {
    _selectTime1 = v;
  }

  set selectTime2(List<DateTime> v) {
    _selectTime2 = v;
  }

  set selectTime3(List<DateTime> v) {
    _selectTime3 = v;
  }

  set selectTime(List<DateTime> v) {
    if (currentTab == 0) {
      _selectTime1 = v;
    }
    if (currentTab == 1) {
      _selectTime2 = v;
    }
    if (currentTab == 2) {
      _selectTime3 = v;
    }
  }

  /// 预约过的时间段
  List<DateTime> appointmentTimes = [];

  TimeState() {}
}
