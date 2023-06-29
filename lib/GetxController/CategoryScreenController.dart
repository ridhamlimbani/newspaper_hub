import 'dart:convert';

import 'package:get/get.dart';
import 'package:newspaper_hub/Model/NewsModel.dart';
import 'package:http/http.dart' as http;
import 'package:newspaper_hub/utils/string.dart';

class CategoriesScreenController extends GetxController{
  RxList<NewsModel> newsModel = <NewsModel>[].obs;

  Future<void> getNewsApi(String query) async {
    newsModel.clear();
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$query&apiKey=${AppString.apikey}"));

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["articles"].forEach((element) {
      NewsModel newsModelElement = NewsModel.fromJson(element);

      newsModel.add(newsModelElement);
    });
    update();

  }
}