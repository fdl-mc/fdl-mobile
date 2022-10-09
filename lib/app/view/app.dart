import 'package:flutter/material.dart';
import 'package:freedomland/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0x4F6D7AFF),
        ),
      ),
      routerConfig: router,
    );
  }
}
