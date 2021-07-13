import 'package:flutter/material.dart';
import 'package:freedomland/utils/build_snackbar.dart';
import 'package:get/get.dart';

void showErrorSnackbar({String? title, required String text}) {
  Get.showSnackbar(
    buildSnackbar(
      title: title,
      text: text,
      color: Colors.red,
      icon: Icons.error_outline,
    ),
  );
}

void showSuccessSnackbar({String? title, required String text}) {
  Get.showSnackbar(
    buildSnackbar(
      title: title,
      text: text,
      color: Colors.green,
      icon: Icons.check_circle_outline,
    ),
  );
}
