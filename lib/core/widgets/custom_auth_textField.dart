import 'package:crewcoffee/core/constants/colors/app_color.dart';
import 'package:crewcoffee/core/settings/size_config.dart';
import 'package:flutter/material.dart';

class CustomAuthTextField extends StatelessWidget {
  const CustomAuthTextField({
    super.key,
    required this.obscureText,
    required this.hintText,
    required this.requireText,
    required this.icon,
    required this.onSaved,
    required this.validator,
    required this.inputType,
  });
  final bool obscureText;
  final String? hintText, requireText;
  final IconData icon;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    SizeConfig().ini(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            requireText!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.defaultSize! * 1.5,
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * .015,
          ),
          TextFormField(
            obscureText: obscureText,
            keyboardType: inputType,
            onSaved: onSaved,
            validator: validator,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.5),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.kBackGroundColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.kBackGroundColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              filled: true,
              fillColor: AppColor.kBackGroundColor,
              prefixIcon: Icon(
                icon,
                color: AppColor.kBrownColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
