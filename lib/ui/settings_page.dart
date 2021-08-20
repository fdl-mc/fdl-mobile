import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freedomland/controller/password_change_controller.dart';
import 'package:freedomland/features/auth/utils/providers.dart';
import 'package:freedomland/ui/general/gradient_app_bar.dart';
import 'package:freedomland/ui/password_change_page.dart';
import 'package:freedomland/ui/theme_change_page.dart';
import 'package:freedomland/utils/app_color.dart';
import 'package:get/get.dart';

class SettingsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final auth = context.read(authServiceProvider);

    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text('Настройки'),
        gradient: getAppColorFromStorage().primaryGradient,
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              contentPadding: EdgeInsets.all(8),
              title: Text('Сменить тему оформления'),
              leading: Padding(
                child: Icon(Icons.palette_outlined),
                padding: EdgeInsets.all(8),
              ),
              onTap: () {
                Get.to(() => ThemeChangePage());
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.all(8),
              title: Text('Изменить пароль'),
              leading: Padding(
                child: Icon(Icons.password_outlined),
                padding: EdgeInsets.all(8),
              ),
              onTap: () {
                Get.to(
                  () => PasswordChangePage(),
                )?.then(
                  (_) => Get.find<PasswordChangeController>().clearValues(),
                );
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.all(8),
              title: Text('Выйти'),
              leading: Padding(
                child: Icon(Icons.logout_outlined),
                padding: EdgeInsets.all(8),
              ),
              onTap: auth.logout,
            ),
          ],
        ).toList(),
      ),
    );
  }
}
