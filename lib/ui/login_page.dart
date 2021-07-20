import 'package:flutter/material.dart';
import 'package:freedomland/controller/auth_controller.dart';
import 'package:freedomland/ui/general/bottom_margin.dart';
import 'package:get/state_manager.dart';

class LoginPage extends GetView<AuthController> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Никнейм'),
              controller: usernameController,
            ),
            BottomMargin(8),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Пароль'),
              controller: passwordController,
            ),
            BottomMargin(8),
            ElevatedButton(
              onPressed: () {
                controller.login(
                  usernameController.text,
                  passwordController.text,
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
