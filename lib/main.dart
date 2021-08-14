import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:freedomland/controller/bindings/initial_binding.dart';
import 'package:freedomland/ui/splash_screen.dart';
import 'package:freedomland/utils/app_color.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await GetStorage.init();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  ).then((_) {
    runApp(Phoenix(child: App()));
  });
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appColor = getAppColorFromStorage();
    return GetMaterialApp(
      defaultTransition: Transition.cupertino,
      initialBinding: InitialBinding(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          brightness: Brightness.dark,
          foregroundColor: Colors.white,
        ),
        primaryColor: appColor.primaryColor,
        accentColor: appColor.secondaryColor,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: appColor.primaryColor,
          selectionColor: appColor.primaryColor.withAlpha(64),
          selectionHandleColor: appColor.primaryColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(appColor.primaryColor),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: appColor.primaryColor),
          ),
          labelStyle: TextStyle(color: Colors.black54),
          focusColor: appColor.primaryColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.black26),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        fontFamily: 'Montserrat',
      ),
      home: SplashScreen(),
    );
  }
}
