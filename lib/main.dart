import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freedomland/constants/routes.dart';
import 'package:freedomland/controller/bindings/initial_binding.dart';
import 'package:freedomland/pages/splash_screen.dart';
import 'package:get/get.dart';

import 'constants/pallettes.dart';

void main() async {
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new App());
  });
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      theme: ThemeData(
          appBarTheme: AppBarTheme(brightness: Brightness.dark),
          primarySwatch: primaryP,
          accentColor: secondaryP,
          fontFamily: 'Ubuntu'),
      home: SplashScreen(),
    );
  }
}
