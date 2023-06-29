import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newspaper_hub/Model/CategoriesModel.dart';
import 'package:newspaper_hub/Model/NewsModel.dart';
import 'package:newspaper_hub/helper/categories.dart';
import 'package:http/http.dart' as http;
import 'package:newspaper_hub/utils/progessBar.dart';
import 'package:newspaper_hub/utils/string.dart';

class HomeScreenController extends GetxController {
  RxList<CategoriesModel> categories = <CategoriesModel>[].obs;
  RxList<NewsModel> newsModel = <NewsModel>[].obs;
  var selectedDate = DateTime.now().obs;
  RxString selectedApiDate="".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    categories = getCategories().obs;
    getNewsApi();
  }

  Future<void> getNewsApi() async {
    newsModel.clear();

    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=Entertainment&from=$selectedApiDate&to=$selectedApiDate&sortBy=popularity&apiKey=${AppString.apikey}"));

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    print(jsonData);
    jsonData["articles"].forEach((element) {
      NewsModel newsModelElement = NewsModel.fromJson(element);

      newsModel.add(newsModelElement);
    });
    update();

  }

  Future<void> selectDate() async {
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now().subtract(Duration(days: 1)),
        firstDate:  DateTime.now().subtract(const Duration(days:30 )),
        lastDate: DateTime.now().subtract(const Duration(days: 1)));
    if (picked != null && picked != selectedDate) {

        selectedDate.value = picked;
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        selectedApiDate = formatter.format(selectedDate.value).obs;
        getNewsApi();
      update();
    }
  }
}
