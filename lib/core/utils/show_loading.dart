import 'package:crewcoffee/core/constants/colors/app_color.dart';
import 'package:flutter/material.dart';

showLoading(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColor.kBackGroundColor,
        title: const Text("  please wait"),
        content: const SizedBox(
          height: 50,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    },
  );
}
