import 'package:flutter/material.dart';
import 'package:flutter_quick/constants/colors.dart';
import 'package:flutter_quick/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class WifiPage extends StatelessWidget {
  final WifiLogic logic = Get.put(WifiLogic());
  final WifiState state = Get.find<WifiLogic>().state;

  WifiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WifiLogic>(
      builder: (_) {
        return Scaffold(
          backgroundColor: Color(0xfff6f6f6),
          appBar: AppBar(
            backgroundColor: ColorConstants.appColor,
            elevation: 0,
            title: Text("Wi-Fi"),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "已连接Wi-Fi",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xff999999),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.only(bottom: 20.w, top: 10.w),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.w,
                        horizontal: 15.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "huuytytrghwi",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xff333333),
                                ),
                              ),
                              Text(
                                "加密",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xff666666),
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            "assets/images/wifi.png",
                            width: 30.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Text(
                  "可用Wi-Fi",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xff999999),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 10.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      separatorBuilder: (ctx, i) {
                        return Divider(
                          color: Color(0xff999999).withOpacity(.2),
                        );
                      },
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Get.toNamed(Routes.wifiPassword);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "huuytytrghwi",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff333333),
                                      ),
                                    ),
                                    Text(
                                      "加密",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff666666),
                                      ),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  "assets/images/wifi.png",
                                  width: 30.w,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: 50,
                    ),
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
