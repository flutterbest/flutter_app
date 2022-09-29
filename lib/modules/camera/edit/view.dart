import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quick/constants/colors.dart';
import 'package:flutter_quick/widgets/buttons/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import 'logic.dart';
import 'state.dart';

class EditPage extends StatelessWidget {
  final EditLogic logic = Get.put(EditLogic());
  final EditState state = Get.find<EditLogic>().state;

  EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditLogic>(
      builder: (_) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: ColorConstants.appColor,
            elevation: 0,
            title: Text("编辑设备"),
            centerTitle: true,
            leadingWidth: 30.w,
            actions: [
              GestureDetector(
                onTap: () {
                  _dialog();
                },
                child: Image.asset(
                  "assets/images/delete.png",
                  width: 25.w,
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                _input(state.controller1, title: "设备昵称"),
                _input(state.controller2, title: "用户名"),
                _input(
                  state.controller3,
                  title: "密码",
                  widget: Icon(
                    Icons.remove_red_eye,
                    size: 14,
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Get.toNamed(Routes.wifi);
                  },
                  child: _input(
                    state.controller4,
                    title: "Wi-Fi连接",
                    enabled: false,
                    widget: Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    logic.showMore();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "高级设置",
                          style: TextStyle(
                            color: Color(0xff333333),
                          ),
                        ),
                        RotatedBox(
                          quarterTurns: !state.showMore ? 1 : 3,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff333333),
                            size: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (state.showMore) _input(state.controller5, title: "IP地址"),
                if (state.showMore) _input(state.controller6, title: "子网掩码"),
                if (state.showMore) _input(state.controller7, title: "网关"),
                if (state.showMore) _input(state.controller8, title: "DNS服务器"),
                SizedBox(height: 30.w),
                AppButton(title: "保存")
              ],
            ),
          ),
        );
      },
    );
  }

  _input(
    TextEditingController controller, {
    String title = "",
    Widget? widget,
    bool enabled = true,
  }) {
    return TextField(
      controller: controller,
      maxLines: 1,
      enabled: enabled,
      style: TextStyle(
        color: Colors.black,
        fontSize: 17.sp,
      ),
      cursorColor: Colors.black,
      textAlign: TextAlign.left,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 15.w, bottom: 15.w),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstants.borderColor,
            width: 1,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstants.borderColor,
            width: 1,
          ),
        ),
        suffixIcon: widget,
        suffixIconConstraints: BoxConstraints(
          maxWidth: 30.w,
        ),
        hintText: title,
        hintStyle: TextStyle(
          color: const Color(0xff999999),
          fontSize: 17.sp,
        ),
      ),
    );
  }

  _dialog() {
    showDialog(
      context: Get.context!,
      builder: (ctx) {
        return Center(
          child: Container(
            width: 300.w,
            height: 160.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 15.w),
                Text(
                  "删除提示",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Color(0xff333333),
                  ),
                ),
                SizedBox(height: 15.w),
                Text(
                  "是否确定删除此设备\n确定请点击确定否则点",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xff666666),
                  ),
                ),
                Expanded(child: Container()),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: 150.w,
                        height: 50.w,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Color(0xff999999).withOpacity(.1),
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "取消",
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Color(0xff333333),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: 150.w,
                        height: 50.w,
                        decoration: BoxDecoration(
                          color: Color(0xff5DB1FB),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "确定",
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
