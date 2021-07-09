import 'package:freedomland/controller/bindings/user_binding.dart';
import 'package:freedomland/pages/about_page.dart';
import 'package:freedomland/pages/home_page.dart';
import 'package:freedomland/pages/login_page.dart';
import 'package:freedomland/pages/splash_screen.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  // GetPage(name: '/', page: () => SplashScreen()),
  GetPage(name: '/login', page: () => LoginPage()),
  GetPage(
    name: '/home',
    page: () => HomePage(),
    binding: UserBinding(),
  ),
  GetPage(name: '/about', page: () => AboutPage()),
];
