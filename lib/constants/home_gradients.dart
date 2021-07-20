import 'package:flutter/material.dart';
import 'package:freedomland/constants/pallettes.dart';

List<Gradient> gradients = [
  LinearGradient(
    begin: Alignment.topLeft, end: Alignment.bottomRight,
    // [secondaryP.shade400, primaryP.shade400]
    colors: [
      secondaryP.shade400,
      primaryP.shade400,
    ],
  ),
  LinearGradient(
    begin: Alignment.topLeft, end: Alignment.bottomRight,
    // [secondaryP.shade400, primaryP.shade400]
    colors: [
      Color(0xFF654ea3),
      Color(0xFFeaafc8),
    ],
  ),
];
