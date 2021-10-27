import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fdl_app/features/routing/misc/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

void main() {
  Routemaster.setPathUrlStrategy();
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
      ),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) {
        return MaterialApp.router(
          title: 'FreedomLand',
          theme: theme,
          darkTheme: darkTheme,
          routeInformationParser: context.read(routerParserProvider),
          routerDelegate: watch(routerDelegateProvider),
        );
      },
    );
  }
}
