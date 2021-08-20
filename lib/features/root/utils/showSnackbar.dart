import 'package:flutter/material.dart';
import 'package:freedomland/features/auth/utils/keys.dart';

/// Shows snackbar using context of the rootKey widget
void showSnackbar(SnackBar snackbar) {
  WidgetsBinding.instance?.addPostFrameCallback((_) {
    ScaffoldMessenger.of(rootKey.currentContext!)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackbar);
  });
}
