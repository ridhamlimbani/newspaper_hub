import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaper_hub/utils/colors.dart';
import 'package:newspaper_hub/widgets/customWidget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsMainScreen extends StatelessWidget {
  final String blogUrl;
  const NewsMainScreen({Key? key,required this.blogUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Completer<WebViewController> _completer=Completer<WebViewController>();
    return Container(
      color: AppColor.white70,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.white70,
          appBar: AppBar(
            title: brandName(),
            leading: IconButton(onPressed: (){
              Get.back();
            },icon: const Icon(Icons.arrow_back_ios_new,color: AppColor.black,),),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: WebView(
            initialUrl: blogUrl,
            onWebViewCreated: ((WebViewController webViewController){
              _completer.complete(webViewController);
            }),
          ),
        ),
      ),
    );
  }
}
