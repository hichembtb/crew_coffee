import 'package:crewcoffee/core/constants/images/app_images.dart';
import 'package:crewcoffee/core/controllers/signup_controller.dart';
import 'package:crewcoffee/core/functions/validator.dart';
import 'package:crewcoffee/core/settings/size_config.dart';
import 'package:crewcoffee/core/widgets/custom_auth_textField.dart';
import 'package:crewcoffee/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/colors/app_color.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController signUpController = Get.put(SignUpController());
    SizeConfig().ini(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        backgroundColor: AppColor.kBrownColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: const AssetImage(
                    kLogo,
                  ),
                  height: SizeConfig.screenHeight! * .25,
                ),
                Text(
                  'Crew Coffee',
                  style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * .03,
                ),
                Form(
                  key: signUpController.formstate,
                  child: Column(
                    children: [
                      CustomAuthTextField(
                        requireText: "Email Address",
                        hintText: 'exemple@mail.com',
                        inputType: TextInputType.emailAddress,
                        obscureText: false,
                        icon: Icons.email_outlined,
                        onSaved: (value) => signUpController.email = value!,
                        validator: (value) {
                          return validator(value!, 5, 50, 'email');
                        },
                      ),
                      CustomAuthTextField(
                        requireText: "Create Your Password",
                        hintText: 'min , 8 characters',
                        inputType: TextInputType.name,
                        obscureText: true,
                        icon: Icons.lock_outlined,
                        onSaved: (value) => signUpController.password = value!,
                        validator: (value) {
                          return validator(value!, 5, 20, 'password');
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("already have an account  "),
                    InkWell(
                      onTap: () {
                        signUpController.switchToLogin();
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          color: AppColor.kBrownColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * .10,
                ),
                CustomGeneralButton(
                  text: "Sign Up",
                  width: SizeConfig.screenWidth! * 0.5,
                  height: SizeConfig.screenHeight! * 0.05,
                  onTap: () {
                    signUpController.signupAndNavigate(context);
                  },
                ),
                const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
