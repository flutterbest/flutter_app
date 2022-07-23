import 'package:flutter/material.dart';
import 'package:flutter_quick/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/loading/loading_empty_widget.dart';
import 'logic.dart';
import 'state.dart';

class AmountListPage extends StatelessWidget {
  final AmountListLogic logic = Get.put(AmountListLogic());
  final AmountListState state = Get.find<AmountListLogic>().state;

  AmountListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AmountListLogic>(
      builder: (l) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              "加钟费用",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          body: state.list == null
              ? Container()
              : state.list!.isEmpty
                  ? Center(child: LoadingEmptyWidget())
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: ListView.separated(
                        itemBuilder: (ctx, i) {
                          var item = state.list![i];
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: 15.w),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${item['addPesonType'] == 1 ? '技师' : '用户'}",
                                      style: TextStyle(
                                        color: Color(0xff262626),
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                    Text(
                                      "+￥${item['addAmount']}",
                                      style: TextStyle(
                                        color: ColorConstants.appColor,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.w,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${item['createTime']}",
                                      style: TextStyle(
                                        color: Color(0xff898989),
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    Text(
                                      "+￥${item['addWay'] == 0 ? '微信' : '支付宝'}",
                                      style: TextStyle(
                                        color: Color(0xff898989),
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (ctx, i) {
                          return Divider(
                            color: Color(0xffEBEBEB),
                            height: 1,
                          );
                        },
                        itemCount: 2,
                      ),
                    ),
        );
      },
    );
  }

  //
}
