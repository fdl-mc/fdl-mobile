import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'pages/home_page.dart';
import 'pallettes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(brightness: Brightness.dark),
          primarySwatch: primaryP,
          accentColor: secondaryP,
          fontFamily: 'Ubuntu'),
      home: HomePage(),
    );
  }
}
