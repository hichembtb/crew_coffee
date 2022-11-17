import 'package:crewcoffee/view/auth/login_screen.dart';
import 'package:crewcoffee/view/auth/signup_screen.dart';
import 'package:crewcoffee/view/home/home_page.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

List<GetPage<dynamic>>? getPages = [
  // First Route , starting page

  // !Auth
  GetPage(name: AppRoute.signUp, page: () => const SignUpScreen()),
  GetPage(name: AppRoute.login, page: () => const LoginScreen()),
  // ? Home
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
];
