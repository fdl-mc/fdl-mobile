import 'package:flutter/material.dart';
import 'package:freedomland/constants/pallettes.dart';
import 'package:freedomland/controller/auth_controller.dart';
import 'package:freedomland/controller/password_change_controller.dart';
import 'package:freedomland/ui/general/gradient_app_bar.dart';
import 'package:freedomland/ui/password_change_page.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text('Настройки'),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            primaryP.shade800,
            primaryP.shade500,
          ],
        ),
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text('Изменить пароль'),
              leading: Icon(Icons.password_outlined),
              onTap: () {
                Get.to(
                  () => PasswordChangePage(),
                  binding: BindingsBuilder.put(
                    () => PasswordChangeController(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Выйти'),
              leading: Icon(Icons.logout_outlined),
              onTap: authController.logout,
            ),
          ],
        ).toList(),
      ),
    );
  }
}
