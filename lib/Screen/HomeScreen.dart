import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:newspaper_hub/GetxController/CategoryScreenController.dart';
import 'package:newspaper_hub/GetxController/HomeScreenController.dart';
import 'package:newspaper_hub/Screen/NewsMainScreen.dart';
import 'package:newspaper_hub/Screen/categoriesScreen.dart';
import 'package:newspaper_hub/utils/colors.dart';
import 'package:newspaper_hub/utils/progessBar.dart';
import 'package:newspaper_hub/widgets/customWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progressBar = ProgressBar();

    return Container(
      color: AppColor.white70,
      child: SafeArea(
        child: GetBuilder<HomeScreenController>(
          init: HomeScreenController(),
          builder: (controller) {
            return Scaffold(
              backgroundColor: AppColor.white70,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                title: brandName(),
                elevation: 0,
                actions: [
                  IconButton(
                      onPressed: () {
                        controller.selectDate();
                      },
                      icon: const Icon(
                        Icons.calendar_month,
                        color: AppColor.black,
                      ))
                ],
              ),
              body: controller.newsModel.isEmpty
                  ? noDataFound()
                  :SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              imageUrl:
                                  controller.categories[index].categorieImage,
                              categoryName:
                                  controller.categories[index].categorieName,
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                     SizedBox(
                            height: MediaQuery.of(context).size.height * 0.92,
                            child: ListView.builder(
                              itemCount: controller.newsModel.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return BlogTile(
                                  imageUrl:
                                      controller.newsModel[index].urlToImage,
                                  title: controller.newsModel[index].title,
                                  desc: controller.newsModel[index].description,
                                  blogUrl: controller.newsModel[index].url,
                                );
                              },
                            ),
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;

  const CategoryTile(
      {Key? key, required this.categoryName, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (controller) {
        return InkWell(
          onTap: () {
            controller.getNewsApi(categoryName);
            Get.to(const CategoriesScreen());
          },
          child: Container(
            margin: const EdgeInsets.only(left: 15),
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      height: 120,
                      width: 120,
                    )),
                Container(
                  alignment: Alignment.center,
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      color: AppColor.black26,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    categoryName,
                    style: const TextStyle(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                )
              ],
            ),
          ),
        );
      },
      init: CategoriesScreenController(),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, blogUrl;

  const BlogTile(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.desc,
      required this.blogUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(NewsMainScreen(
          blogUrl: blogUrl,
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                memCacheHeight: 450,
                memCacheWidth: 1024,
                imageUrl: imageUrl,
                placeholder: (context, url) => newsShimmer(),
                errorWidget: (context, url, error) => newsErrorShimmer(),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: AppColor.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              desc,
              style: const TextStyle(color: AppColor.grey),
            ),
          ],
        ),
      ),
    );
  }
}
