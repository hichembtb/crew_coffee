import 'package:crewcoffee/core/constants/colors/app_color.dart';
import 'package:crewcoffee/core/constants/shared/decoration.dart';
import 'package:crewcoffee/core/controllers/home_page_controller.dart';
import 'package:crewcoffee/core/settings/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().ini(context);
    HomePageController homePageController = Get.put(HomePageController());
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.kBackGroundColor,
            AppColor.kBrownColor,
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
          stops: const [0.0, 1.0],
          tileMode: TileMode.mirror,
        ),
      ),
      height: SizeConfig.screenHeight! * 0.5,
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
      child: Form(
        key: homePageController.formstate,
        child: Column(
          children: [
            const Text(
              'Update Your Coffee Settings',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.025,
            ),
            TextFormField(
              initialValue: homePageController.currentName,
              decoration: textInputDecoration,
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a name' : null,
              onChanged: (value) => homePageController.currentName = value,
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.015,
            ),
            // drop down
            DropdownButtonFormField(
              decoration: textInputDecoration,
              value: homePageController.currentSugars,
              items: homePageController.sugars.map((sugar) {
                return DropdownMenuItem(
                  value: sugar,
                  child: Text('$sugar sugars'),
                );
              }).toList(),
              onChanged: (value) => homePageController.currentSugars = value!,
            ),
            // slider
            GetBuilder<HomePageController>(builder: (controller) {
              return Slider(
                value: (controller.currentStrength).toDouble(),
                activeColor: Colors.brown[controller.currentStrength],
                inactiveColor: Colors.brown[controller.currentStrength],
                min: 100.0,
                max: 900.0,
                divisions: 8,
                onChanged: (value) => homePageController.onChanged(value),
              );
            }),
            // button
            MaterialButton(
              onPressed: () => homePageController.writeToDb(),
              color: AppColor.kBrownColor,
              child: const Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
