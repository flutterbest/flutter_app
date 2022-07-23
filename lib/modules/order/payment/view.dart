import 'package:flutter/material.dart';
import 'package:flutter_quick/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class OrderPaymentPage extends StatelessWidget {
  final OrderPaymentLogic logic = Get.put(OrderPaymentLogic());
  final OrderPaymentState state = Get.find<OrderPaymentLogic>().state;

  OrderPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "收款二维码",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: GetBuilder<OrderPaymentLogic>(
        builder: (logic) {
          return state.data == null
              ? Container()
              : SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 90.w),
                        Text(
                          "扫码向技师付款",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Color(0xff202020),
                          ),
                        ),
                        SizedBox(height: 32.w),
                        Container(
                          width: 212.w,
                          height: 212.w,
                          margin: EdgeInsets.only(top: 32.w, bottom: 59.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffe2e2e2),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: state.image!,
                          ),
                        ),
                        Text(
                          "￥${state.data!['amount']}",
                          style: TextStyle(
                            fontSize: 30.sp,
                            color: ColorConstants.appColor,
                          ),
                        ),
                        SizedBox(height: 15.w),
                        Text(
                          state.data!['payWay'] == 0 ? "微信支付" : "支付宝支付",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Color(0xff202020),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
