import 'package:flutter/material.dart';
import 'package:freedomland/constants/app_colors.dart';
import 'package:freedomland/controller/storage_service.dart';

class AppColor {
  final Gradient backgroundGradient;
  final Gradient primaryGradient;
  final Gradient secondaryGradient;
  final Color primaryColor;
  final Color secondaryColor;
  final String name;

  AppColor({
    required this.backgroundGradient,
    required this.primaryColor,
    required this.secondaryColor,
    required this.primaryGradient,
    required this.secondaryGradient,
    required this.name,
  });
}

AppColor getAppColorFromStorage() {
  return appColors[StorageService().read(
    'gradientIndex',
    defaultValue: 0,
  )];
}
