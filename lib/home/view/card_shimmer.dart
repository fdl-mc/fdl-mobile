import 'package:flutter/material.dart';
import 'package:freedomland/home/view/card_base.dart';
import 'package:shimmer/shimmer.dart';

class CardShimmer extends StatelessWidget {
  final double height;

  const CardShimmer({required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: CardBase(child: SizedBox(height: height)),
    );
  }
}
