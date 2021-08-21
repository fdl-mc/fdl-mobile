import 'package:flutter/material.dart';

/// Shows snackbar
void showSnackbar(BuildContext context, SnackBar snackbar) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackbar);
}
