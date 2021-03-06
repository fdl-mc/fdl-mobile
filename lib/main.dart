import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fdl_app/features/routing/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:routemaster/routemaster.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Routemaster.setPathUrlStrategy();
  await Firebase.initializeApp();
  await Settings.init();
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    return AdaptiveTheme(
      light: ThemeData(
        primarySwatch: Colors.indigo,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
          accentColor: Colors.indigoAccent,
          brightness: Brightness.light,
        ),
      ),
      dark: ThemeData(
        primarySwatch: Colors.grey,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.grey,
          accentColor: Colors.grey,
          brightness: Brightness.dark,
        ),
      ),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) {
        return MaterialApp.router(
          title: 'FreedomLand',
          theme: theme,
          darkTheme: darkTheme,
          routeInformationParser: context.read(routerParserProvider),
          routerDelegate: watch(routerDelegateProvider),
          debugShowCheckedModeBanner: false,
          builder: (context, child) => ResponsiveWrapper.builder(
            child,
            maxWidth: 1200,
            minWidth: 480,
            breakpoints: const [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ],
            background: Container(color: const Color(0xFFF5F5F5)),
          ),
        );
      },
    );
  }
}
