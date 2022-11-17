import 'package:crewcoffee/core/constants/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustDrawerController extends GetxController {
  // ! Signout Function
  signout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.deleteAll();
      Get.offAllNamed(AppRoute.login);
    } catch (error) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Internet Problem "),
            content: Container(
              height: 50,
            ),
          );
        },
      );
    }
  }
}
