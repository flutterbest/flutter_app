import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quick/repository/user_repository.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class CityWidget extends StatefulWidget {
  final Function(Map<String, dynamic>)? onConfirm;
  final int type;

  const CityWidget({Key? key, this.onConfirm,this.type = 1}) : super(key: key);

  @override
  State<CityWidget> createState() => _CityWidgetState();
}

class _CityWidgetState extends State<CityWidget> {
  List province = [];
  int provinceIndex = 0;

  List city = [];
  int cityIndex = 0;

  List area = [];
  int areaIndex = 0;

  @override
  void initState() {
    super.initState();

    UserRepository.getAllListByCondition(1, null,type: widget.type).then((v0) {
      if (v0 != null) {
        setState(() {
          province = v0;
        });

        // 获取市
        UserRepository.getAllListByCondition(2, v0[0]['id'],type: widget.type).then((v1) {
          if (v1 != null) {
            setState(() {
              city = v1;
            });

            // 获取区县
            UserRepository.getAllListByCondition(3, v1[0]['id'],
                    type: widget.type).then((v2) {
              if (v2 != null) {
                setState(() {
                  area = v2;
                });
              }
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 300,
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "取消",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (city.isEmpty) return;
                    Navigator.pop(context);
                    if (widget.onConfirm != null) {
                      Map<String, dynamic> data = {
                        "province": province[provinceIndex],
                        "city": city[cityIndex],
                        "area": area[areaIndex],
                      };
                      widget.onConfirm!(data);
                    }
                  },
                  child: Text(
                    "确定",
                    style: TextStyle(
                      color: ColorConstants.appColor,
                      fontSize: 18.sp,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.w),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// 省
                  Container(
                    width: 120.w,
                    height: double.infinity,
                    child: province.isEmpty
                        ? Container()
                        : CupertinoPicker(
                            itemExtent: 28,
                            squeeze: 1.0,
                            onSelectedItemChanged: (index) {
                              setState(() {
                                provinceIndex = index;
                              });
                              setState(() {
                                city = [];
                                cityIndex = 0;
                                area = [];
                                areaIndex = 0;
                              });

                              /// 查询市
                              UserRepository.getAllListByCondition(
                                      2, province[index]['id'],
                                      type: widget.type)
                                  .then((v) {
                                if (v != null) {
                                  setState(() {
                                    city = v;
                                  });

                                  /// 查询区县
                                  UserRepository.getAllListByCondition(
                                          3, city[0]['id'],
                                          type: widget.type)
                                      .then((v1) {
                                    if (v1 != null) {
                                      setState(() {
                                        area = v1;
                                      });
                                    }
                                  });
                                }
                              });
                            },
                            selectionOverlay: Container(
                              color: Colors.transparent,
                            ),
                            scrollController: FixedExtentScrollController(
                              initialItem: 0,
                            ),
                            backgroundColor: Colors.transparent,
                            children: province
                                .asMap()
                                .map(
                                  (i, value) => MapEntry(
                                    i,
                                    Container(
                                      child: Center(
                                        child: Text(
                                          "${province[i]['name']}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .values
                                .toList(),
                          ),
                  ),

                  // 市
                  Container(
                    width: 120.w,
                    height: double.infinity,
                    child: city.isEmpty
                        ? Container()
                        : CupertinoPicker(
                            itemExtent: 28,
                            squeeze: 1.0,
                            onSelectedItemChanged: (index) {
                              setState(() {
                                cityIndex = index;
                              });

                              UserRepository.getAllListByCondition(
                                      3, city[index]['id'],
                                      type: widget.type)
                                  .then((v) {
                                if (v != null) {
                                  setState(() {
                                    area = v;
                                  });
                                }
                              });
                            },
                            selectionOverlay: Container(
                              color: Colors.transparent,
                            ),
                            scrollController: FixedExtentScrollController(
                              initialItem: 0,
                            ),
                            backgroundColor: Colors.transparent,
                            children: city
                                .asMap()
                                .map(
                                  (i, value) => MapEntry(
                                    i,
                                    Container(
                                      child: Center(
                                        child: Text(
                                          "${city[i]['name']}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .values
                                .toList(),
                          ),
                  ),

                  // 区县
                  Container(
                    width: 120.w,
                    height: double.infinity,
                    child: area.isEmpty
                        ? Container()
                        : CupertinoPicker(
                            itemExtent: 28,
                            squeeze: 1.0,
                            onSelectedItemChanged: (index) {
                              setState(() {
                                areaIndex = index;
                              });
                            },
                            selectionOverlay: Container(
                              color: Colors.transparent,
                            ),
                            scrollController: FixedExtentScrollController(
                              initialItem: 0,
                            ),
                            backgroundColor: Colors.transparent,
                            children: area
                                .asMap()
                                .map(
                                  (i, value) => MapEntry(
                                    i,
                                    Container(
                                      child: Center(
                                        child: Text(
                                          "${area[i]['name']}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .values
                                .toList(),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
