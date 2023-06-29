import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaper_hub/GetxController/CategoryScreenController.dart';
import 'package:newspaper_hub/Screen/HomeScreen.dart';
import 'package:newspaper_hub/utils/colors.dart';
import 'package:newspaper_hub/widgets/customWidget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white70,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: brandName(),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: AppColor.white70,
          body: GetBuilder(
            init: CategoriesScreenController(),
            builder: (controller){
              return SingleChildScrollView(
                child: ListView.builder(
                    itemCount: controller.newsModel.length,
                    scrollDirection: Axis.vertical,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return BlogTile(
                        imageUrl: controller.newsModel[index].urlToImage,
                        title: controller.newsModel[index].title,
                        desc: controller.newsModel[index].description,
                        blogUrl: controller.newsModel[index].url,
                      );
                    }),
              );
            },
          ),
        ),
      ),
    );
  }
}
