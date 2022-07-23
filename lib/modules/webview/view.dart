import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

class WebViewPage extends StatelessWidget {
  final logic = Get.put(WebViewLogic());
  final state = Get.find<WebViewLogic>().state;

  WebViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: .5,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          Get.arguments['title'] ?? "合作协议",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: InAppWebView(
        onWebViewCreated: (webViewController) {
          state.webViewController = webViewController;
        },
        initialUrlRequest: URLRequest(
          url: Uri.parse(
            Get.arguments['url'],
          ),
        ),
      ),
    );
  }
}
