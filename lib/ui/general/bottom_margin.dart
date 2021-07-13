import 'package:flutter/material.dart';

class BottomMargin extends StatelessWidget {
  final double amount;
  BottomMargin(this.amount);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(bottom: amount));
  }
}
