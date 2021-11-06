import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    return const Scaffold(
      body: Center(
        child: Text('gg'),
      ),
    );
  }
}
