import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freedomland/controller/bindings/initial_binding.dart';
import 'package:freedomland/ui/splash_screen.dart';
import 'package:get/get.dart';
// import 'package:responsive_framework/responsive_framework.dart';

import 'constants/pallettes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  ).then((_) {
    runApp(new App());
  });
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // builder: (context, widget) {
      //   return ResponsiveWrapper.builder(
      //     widget,
      //     // maxWidth: 1200,
      //     minWidth: 480,
      //     defaultScale: true,
      //     breakpoints: [
      //       ResponsiveBreakpoint.resize(600, name: MOBILE),
      //       ResponsiveBreakpoint.autoScale(1000, name: TABLET),
      //       ResponsiveBreakpoint.resize(1280, name: DESKTOP),
      //     ],
      //   );
      // },
      defaultTransition: Transition.cupertino,
      initialBinding: InitialBinding(),
      theme: ThemeData(
          appBarTheme: AppBarTheme(brightness: Brightness.dark),
          primarySwatch: primaryP,
          accentColor: secondaryP,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.black26),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          fontFamily: 'Montserrat'),
      home: SplashScreen(),
    );
  }
}
