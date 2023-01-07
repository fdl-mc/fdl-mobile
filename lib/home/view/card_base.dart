import 'package:flutter/material.dart';

class CardBase extends StatelessWidget {
  final Widget child;

  const CardBase({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: child,
        ),
      ),
    );
  }
}
