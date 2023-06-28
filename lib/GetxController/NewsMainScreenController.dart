import 'dart:async';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsMainScreenController extends GetxController{
  final Rx<Completer<WebViewController>> _completer=Completer<WebViewController>().obs;
}