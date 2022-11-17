import 'package:crewcoffee/core/constants/colors/app_color.dart';
import 'package:crewcoffee/core/constants/images/app_images.dart';
import 'package:crewcoffee/core/controllers/home_page_controller.dart';
import 'package:crewcoffee/core/settings/size_config.dart';
import 'package:crewcoffee/core/widgets/custom_drawer.dart';
import 'package:crewcoffee/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().ini(context);
    HomePageController homePageController = Get.put(HomePageController());
    return GetBuilder<HomePageController>(builder: (controller) {
      return RefreshIndicator(
        onRefresh: controller.fetchCoffees,
        child: Scaffold(
          body: Stack(
            children: [
              Scaffold(
                extendBodyBehindAppBar: true,
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  title: const Text('Crew Coffee'),
                  actions: [
                    IconButton(
                      onPressed: () =>
                          homePageController.showSettingsPanel(context),
                      icon: const Icon(Icons.settings),
                    ),
                  ],
                ),
                drawer: CustomDrawer(
                  userEmail: homePageController.user!.email!,
                  coffeeStrength: homePageController.currentStrength,
                ),
                body: Container(
                  height: SizeConfig.screenHeight,
                  width: SizeConfig.screenWidth,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        kGradient,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: homePageController.userInstance.length,
                    itemBuilder: (context, index) {
                      UserModel user = homePageController.userInstance[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Card(
                          color: AppColor.kSoftBackGroundColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: AppColor.kBrownColor[user.strength]!,
                                width: 1),
                            borderRadius: const BorderRadius.all(
                                Radius.elliptical(20, 5)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: const AssetImage(kCoffee),
                                    backgroundColor:
                                        AppColor.kBrownColor[user.strength],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.screenHeight! * .015,
                                  ),
                                  Text(
                                    user.name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: SizeConfig.defaultSize! * 1.5,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.screenHeight! * .015,
                                  ),
                                  Text(
                                    'Takes ${user.sugars} sugar(s)',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: SizeConfig.defaultSize! * 1.5,
                                      color: Colors.black.withOpacity(.4),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
