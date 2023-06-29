import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaper_hub/Screen/HomeScreen.dart';
import 'package:newspaper_hub/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

Widget brandName() {
  return RichText(
    text: const TextSpan(
      children: [
        TextSpan(
          text: "NewsPaper",
          style: TextStyle(
              color: AppColor.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: "Fontmirror"),
        ),
        TextSpan(
          text: "Hub",
          style: TextStyle(
              color: AppColor.purple,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: "Fontmirror"),
        ),
      ],
    ),
  );
}

Widget newsShimmer() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    enabled: true,
    child: Container(
      height: 170,
      width: double.infinity,
      decoration: BoxDecoration(color: AppColor.purple,borderRadius: BorderRadius.circular(10)),
    ),
  );
}

Widget newsErrorShimmer() {
  return Shimmer.fromColors(
    baseColor: Colors.grey,
    highlightColor: Colors.grey.shade100,
    enabled: true,
    child:  Container(
      height: 170,
      width: double.infinity,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.error,color: AppColor.black,),
          Text("No Image Found...",style: TextStyle(color: AppColor.black),),
        ],
      ),
    ),
  );
}

Widget noDataFound() {
  return Shimmer.fromColors(
    baseColor: Colors.grey,
    highlightColor: Colors.grey.shade100,
    enabled: true,
    child:  SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(Get.context!).size.height * 0.08,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: const SizedBox(
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
                          child: const Text(
                            "",
                            style: TextStyle(
                                color: AppColor.white,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(Get.context!).size.height * 0.92,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:  Container(
                          height: 170,
                          width: double.infinity,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "",
                        style: TextStyle(
                            color: AppColor.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "",
                        style: TextStyle(color: AppColor.grey),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

        ],
      ),
    ),
  );
}
