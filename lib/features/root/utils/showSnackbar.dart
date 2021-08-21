import 'package:flutter/material.dart';

/// Shows snackbar
void showSnackbar(BuildContext context, SnackBar snackbar) {
  WidgetsBinding.instance?.addPostFrameCallback((_) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackbar);
  });
}
