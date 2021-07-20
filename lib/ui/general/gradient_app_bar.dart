import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GradientAppBar extends StatelessWidget with PreferredSizeWidget {
  final Gradient gradient;
  final Widget title;
  final bool centerTitle;
  final List<Widget> actions;

  const GradientAppBar({
    required this.gradient,
    required this.title,
    this.centerTitle: false,
    this.actions: const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: title,
      backwardsCompatibility: false,
      flexibleSpace: Container(
        decoration: BoxDecoration(gradient: gradient),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
