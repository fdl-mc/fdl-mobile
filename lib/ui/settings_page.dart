import 'package:flutter/material.dart';
import 'package:freedomland/constants/pallettes.dart';
import 'package:freedomland/controller/auth_controller.dart';
import 'package:freedomland/controller/user_controller.dart';
import 'package:freedomland/ui/general/gradient_app_bar.dart';
import 'package:freedomland/utils/build_snackbar.dart';
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
                Get.showSnackbar(
                  buildSnackbar(
                    text:
                        'пока нельзя, я ленивая жопа бамсь бомсь бамсь бомсь бамсь бомсь я все',
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
