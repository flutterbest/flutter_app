import 'package:flutter/material.dart';
import 'package:flutter_quick/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class MessagePage extends StatelessWidget {
  final MessageLogic logic = Get.put(MessageLogic());
  final MessageState state = Get.find<MessageLogic>().state;

  MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageLogic>(
      builder: (_) {
        return Scaffold(
          backgroundColor: Color(0xfff6f6f6),
          appBar: AppBar(
            backgroundColor: ColorConstants.appColor,
            elevation: 0,
            title: Text("消息"),
            centerTitle: true,
          ),
          body: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 15.w),
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "好友共享设备",
                                style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "2022/09/06 17:50",
                                style: TextStyle(
                                  color: Color(0xff999999),
                                  fontSize: 12.sp,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10.w),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "共享账号：7989964",
                                style: TextStyle(
                                  color: Color(0xff666666),
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                "设备名称：设备名称",
                                style: TextStyle(
                                  color: Color(0xff666666),
                                  fontSize: 12.sp,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xff999999).withOpacity(.2),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 120.w,
                              height: 30.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                  alignment: Alignment.topCenter,
                                  image: AssetImage(
                                    "assets/images/refuse_btn.png",
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "拒绝",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 120.w,
                              height: 30.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                  alignment: Alignment.topCenter,
                                  image: AssetImage(
                                    "assets/images/accept_btn.png",
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "接受",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: 5,
          ),
        );
      },
    );
  }
}
