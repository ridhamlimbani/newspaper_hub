import 'package:flutter/material.dart';
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
