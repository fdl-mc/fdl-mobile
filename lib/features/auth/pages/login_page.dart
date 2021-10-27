import 'package:fdl_app/features/auth/misc/providers.dart';
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
        minimum: const EdgeInsets.all(32),
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
              child: Center(
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(labelText: 'Username'),
                      controller: _usernameController,
                    ),
                    const Space(24),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Password'),
                      controller: _passwordController,
                    ),
                    const Space(32),
                    SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () {
                          context
                              .read(authServiceProvider)
                              .signInWithEmailAndPassword(
                                _usernameController.text + '@fdl.ru',
                                _passwordController.text,
                              );
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
            ),
          ],
        ),
      ),
    );
  }
}
