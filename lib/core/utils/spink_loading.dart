import 'package:crewcoffee/core/constants/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ShowSpinkLoading extends StatelessWidget {
  const ShowSpinkLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.kBackGroundColor,
      child: const Center(
        child: SpinKitChasingDots(
          color: AppColor.kBrownColor,
          size: 50,
        ),
      ),
    );
  }
}
