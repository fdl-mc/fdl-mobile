import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fdl_app/features/routing/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Routemaster.setPathUrlStrategy();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
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
        );
      },
    );
  }
}
