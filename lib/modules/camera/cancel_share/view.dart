import 'package:flutter/material.dart';
import 'package:flutter_quick/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class CancelSharePage extends StatelessWidget {
  final CancelShareLogic logic = Get.put(CancelShareLogic());
  final CancelShareState state = Get.find<CancelShareLogic>().state;

  CancelSharePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CancelShareLogic>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConstants.appColor,
            elevation: 0,
            title: Text("取消共享 "),
            centerTitle: true,
            actions: [
              GestureDetector(
                onTap: () {},
                child: Center(
                  child: Text(
                    "全部取消",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          body: Container(
            color: Colors.white,
            width: 375.w,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.w),
                Text(
                  "设备名称:xxxx",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xff999999),
                  ),
                ),
                Container(
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
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              width: 100.w,
                              child: Text(
                                "好友账号",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xff666666),
                                ),
                              ),
                            ),
                            Text(
                              "123456",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xff333333),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 75.w,
                        height: 25.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff5DB1FB),
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(
                            "取消共享",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xff5DB1FB),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
