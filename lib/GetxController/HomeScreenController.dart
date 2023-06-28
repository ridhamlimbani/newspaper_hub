import 'dart:convert';

import 'package:get/get.dart';
import 'package:newspaper_hub/Model/CategoriesModel.dart';
import 'package:newspaper_hub/Model/NewsModel.dart';
import 'package:newspaper_hub/helper/categories.dart';
import 'package:http/http.dart' as http;
import 'package:newspaper_hub/utils/progessBar.dart';
import 'package:newspaper_hub/utils/string.dart';

class HomeScreenController extends GetxController {
  RxList<CategoriesModel> categories = <CategoriesModel>[].obs;
  RxList<NewsModel> newsModel = <NewsModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    categories = getCategories().obs;
    getNewsApi();
  }

  Future<void> getNewsApi() async {

    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=Entertainment&from=2023-06-27&to=2023-06-27&sortBy=popularity&apiKey=${AppString.apikey}"));

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["articles"].forEach((element) {
      NewsModel newsModelElement = NewsModel.fromJson(element);

      newsModel.add(newsModelElement);
    });
    update();

  }
}
