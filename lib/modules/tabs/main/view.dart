import 'package:flutter/material.dart';
import 'package:flutter_quick/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../events.dart';
import 'logic.dart';
import 'state.dart';

class MainPage extends StatelessWidget {
  final MainLogic logic = Get.put(MainLogic());
  final MainState state = Get.find<MainLogic>().state;

  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainLogic>(builder: (logic) {
      return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: state.pageController,
          children: state.pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/tab1.png",
                width: 26.w,
                color: Color(0xff929292),
              ),
              label: "订单",
              activeIcon: Image.asset(
                "assets/images/tab1.png",
                width: 26.w,
                color: ColorConstants.appColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/tab2.png",
                width: 26.w,
                color: Color(0xff929292),
              ),
              activeIcon: Image.asset(
                "assets/images/tab2.png",
                width: 26.w,
                color: ColorConstants.appColor,
              ),
              label: "时间",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/tab3.png",
                width: 26.w,
                color: Color(0xff929292),
              ),
              activeIcon: Image.asset(
                "assets/images/tab3.png",
                width: 26.w,
                color: ColorConstants.appColor,
              ),
              label: "我的",
            ),
          ],
          currentIndex: state.current,
          selectedFontSize: 12.sp,
          unselectedFontSize: 12.sp,
          selectedItemColor: ColorConstants.appColor,
          unselectedItemColor: const Color(0xff929292),
          onTap: (index) {
            state.current = index;
            state.pageController.jumpToPage(index);
            eventBus.fire(UpdateTabEvent(index));

            logic.update();
          },
          backgroundColor: Colors.white,
        ),
      );
    });
  }
}
