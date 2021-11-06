import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fdl_app/features/auth/misc/auth_state.dart';
import 'package:fdl_app/features/routing/misc/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Routemaster.setPathUrlStrategy();

  await Supabase.initialize(
    authCallbackUrlHostname: 'fdl://login',
    url: 'https://vlfogmrtjegbzstkpimm.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzNjAzNDk0NSwiZXhwIjoxOTUxNjEwOTQ1fQ.-6o1uX6drg35wdwbDtsSt4KBjbZD68lNvsjJuQrMVb8',
  );

  runApp(const ProviderScope(child: App()));
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends AuthState {
  @override
  void initState() {
    recoverSupabaseSession().then((value) => print('state: $value'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        return AdaptiveTheme(
          light: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.teal,
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
              routerDelegate: RoutemasterDelegate(
                routesBuilder: (BuildContext context) {
                  return watch(routeMapProvider).state;
                },
              ),
            );
          },
        );
      },
    );
  }
}
