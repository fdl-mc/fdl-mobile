import 'package:flutter/material.dart';

class BottomSheetPage extends StatelessWidget {
  final Widget? child;
  final double? height;

  const BottomSheetPage({
    this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black38)],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: child,
    );
  }
}
