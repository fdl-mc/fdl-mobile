import 'package:flutter/material.dart';
import 'package:freedomland/controller/auth_controller.dart';
import 'package:freedomland/pages/home_page.dart';
import 'package:freedomland/pages/login_page.dart';
import 'package:get/get.dart';

class Root extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.user?.uid == null) {
        return LoginPage();
      } else {
        return HomePage();
      }
    });
  }
}
