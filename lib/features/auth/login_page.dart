import 'package:fdl_app/features/auth/providers.dart';
import 'package:fdl_app/shared/custom_icons.dart';
import 'package:fdl_app/shared/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: Center(
                child: Icon(
                  CustomIcons.fdl_icon,
                  size: 64,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: const InputDecoration(labelText: 'Username'),
                    controller: _usernameController,
                  ),
                  const BSpacer(24),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Password'),
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  const BSpacer(32),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        context
                            .read(authServiceProvider)
                            .signInWithEmailAndPassword(
                              _usernameController.text + '@fdl.ru',
                              _passwordController.text,
                            )
                            .catchError((e) {
                          if (e.code == 'wrong-password' ||
                              e.code == 'user-not-found') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Wrong username or password.'),
                              ),
                            );
                          }
                          if (e.code == 'user-disabled') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('This account is disabled.'),
                              ),
                            );
                          }
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Login'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
