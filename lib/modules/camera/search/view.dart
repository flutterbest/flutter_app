import 'package:flutter/material.dart';
import 'package:flutter_quick/constants/colors.dart';
import 'package:flutter_quick/widgets/loading/loading_empty_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class SearchPage extends StatelessWidget {
  final SearchLogic logic = Get.put(SearchLogic());
  final SearchState state = Get.find<SearchLogic>().state;

  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchLogic>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConstants.appColor,
            elevation: 0,
            leading: Container(),
            leadingWidth: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 300.w,
                  height: 30.w,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: TextField(
                    controller: state.textEditingController,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.sp,
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    textInputAction: TextInputAction.search,
                    cursorColor: Colors.black,
                    onChanged: (c) {
                      state.loading = true;
                      logic.update();
                    },
                    onSubmitted: (c) {
                      logic.refreshData(init: true);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Image.asset(
                        "assets/images/search.png",
                        width: 18.w,
                        height: 18.w,
                      ),
                      prefixIconConstraints: BoxConstraints(
                        maxWidth: 25.w,
                        minWidth: 25.w,
                      ),
                      hintText: '请输入设备名称',
                      hintStyle: TextStyle(
                        color: const Color(0xffffffff),
                        fontSize: 13.sp,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.w),
                  child: state.textEditingController.text.isEmpty
                      ? GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            "取消",
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            logic.refreshData(init: true);
                          },
                          child: Text(
                            "搜索",
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                )
              ],
            ),
          ),
          body: state.list.length == 0
              ? Center(child: LoadingEmptyWidget())
              : ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 15.w),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/tmp1.png",
                            width: 345.w,
                            height: 154.w,
                          ),
                          Container(
                              padding: EdgeInsets.all(15.w),
                              color: Color(0xffefefef),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "设备名称",
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "链接网络：HTMILWI-FI",
                                        style: TextStyle(
                                          color: Color(0xff666666),
                                          fontSize: 14.sp,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          "assets/images/edit.png",
                                          width: 25.w,
                                        ),
                                      ),
                                      SizedBox(width: 20.w),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          "assets/images/share.png",
                                          width: 25.w,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )),
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
