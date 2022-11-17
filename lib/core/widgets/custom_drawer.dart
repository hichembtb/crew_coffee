import 'package:crewcoffee/core/constants/colors/app_color.dart';
import 'package:crewcoffee/core/constants/images/app_images.dart';
import 'package:crewcoffee/core/controllers/drawer_controller.dart';
import 'package:crewcoffee/core/settings/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer(
      {super.key, required this.userEmail, required this.coffeeStrength});
  final String userEmail;
  final int coffeeStrength;
  @override
  Widget build(BuildContext context) {
    CustDrawerController drawerController = Get.put(CustDrawerController());
    SizeConfig().ini(context);
    return Drawer(
      child: Material(
        color: AppColor.kSoftBackGroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DrawerHeader(
              userEmail: userEmail,
              coffeeStrength: coffeeStrength,
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.7,
            ),
            const Divider(
              color: AppColor.kBlackColor,
            ),
            MenuItem(
              text: 'Disconnect',
              icon: Icons.logout,
              onTap: () => drawerController.signout(context),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader(
      {super.key, required this.userEmail, required this.coffeeStrength});
  final String userEmail;
  final int coffeeStrength;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: const AssetImage(kCoffee),
            backgroundColor: AppColor.kBrownColor[coffeeStrength],
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            userEmail,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem(
      {super.key, required this.text, required this.icon, required this.onTap});
  final String text;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: AppColor.kBlackColor,
      ),
      title: Text(
        text,
        style: const TextStyle(
          color: AppColor.kBlackColor,
        ),
      ),
    );
  }
}
