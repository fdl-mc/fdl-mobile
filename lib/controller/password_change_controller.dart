import 'package:flutter/material.dart';
import 'package:freedomland/controller/auth_controller.dart';
import 'package:freedomland/controller/user_controller.dart';
import 'package:freedomland/utils/snackbars.dart';
import 'package:get/get.dart';

class PasswordChangeController extends GetxController {
  final oldPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  final authController = Get.find<AuthController>();
  final userController = Get.find<UserController>();

  Future<void> chagnePassword() async {
    final oldPassword = oldPasswordController.value.text;
    final password = passwordController.value.text;
    final confirm = confirmController.value.text;

    if (password.length < 6) {
      return showErrorSnackbar(
        text: 'Минимальная длина пароля - 6 символов.',
      );
    } else if (password != confirm) {
      return showErrorSnackbar(
        text: 'Пароли не совпадают',
      );
    } else {
      authController.changePassword(
        userController.state!.name,
        oldPassword,
        password,
      );
    }
  }

  void clearValues() {
    oldPasswordController.clear();
    passwordController.clear();
    confirmController.clear();
  }
}
