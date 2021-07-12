import 'package:flutter/material.dart';
import 'package:get/get.dart';

GetBar buildSnackbar(
    {String? title,
    required String text,
    Color color: const Color(0xFF303030),
    IconData? icon}) {
  return GetBar(
    title: title,
    message: text,
    snackPosition: SnackPosition.BOTTOM,
    barBlur: 0.5,
    backgroundColor: color,
    duration: Duration(seconds: 3),
    animationDuration: Duration(milliseconds: 100),
    icon: icon == null
        ? null
        : Icon(
            icon,
            color: Colors.white,
          ),
  );
}
