import 'package:flutter/material.dart';
import 'package:freedomland/features/auth/utils/keys.dart';

/// Shows snackbar
void showSnackbar(BuildContext context, SnackBar snackbar) {
  WidgetsBinding.instance?.addPostFrameCallback((_) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackbar);
  });
}
