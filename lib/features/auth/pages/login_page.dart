import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freedomland/features/auth/utils/providers.dart';
import 'package:freedomland/ui/general/bottom_margin.dart';

class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final authService = context.read(authServiceProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Никнейм'),
              // controller: usernameController,
              onChanged: (value) {
                context.read(usernameTextStateProvider).state = value;
              },
            ),
            BottomMargin(8),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Пароль'),
              // controller: passwordController,
              onChanged: (value) {
                context.read(passwordTextStateProvider).state = value;
              },
            ),
            BottomMargin(8),
            ElevatedButton(
              onPressed: () {
                authService.login(
                  context.read(usernameTextStateProvider).state,
                  context.read(passwordTextStateProvider).state,
                );
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text('Войти'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
