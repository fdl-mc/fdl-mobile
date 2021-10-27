import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      builder: (theme, darkTheme) => MaterialApp(
        title: 'FreedomLand',
        theme: theme,
        darkTheme: darkTheme,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('FreedomLand'),
          ),
          body: const Center(
            child: Text('Hello world!'),
          ),
        ),
      ),
    );
  }
}
