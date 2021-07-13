import 'package:flutter/material.dart';
import 'package:freedomland/constants/pallettes.dart';
import 'package:freedomland/controller/password_change_controller.dart';
import 'package:freedomland/ui/general/bottom_margin.dart';
import 'package:freedomland/ui/general/bottom_sheet_page.dart';
import 'package:freedomland/ui/general/gradient_app_bar.dart';
import 'package:freedomland/ui/general/gradient_button.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class PasswordChangePage extends GetView<PasswordChangeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text('Изменение пароля'),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            primaryP.shade800,
            primaryP.shade500,
          ],
        ),
      ),
      body: Scrollbar(
        child: SafeArea(
          minimum: EdgeInsets.all(16),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(hintText: 'Старый пароль'),
                controller: controller.oldPasswordController,
              ),
              BottomMargin(16),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(hintText: 'Новый пароль'),
                controller: controller.passwordController,
              ),
              BottomMargin(18),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(hintText: 'Подтверждение'),
                controller: controller.confirmController,
              ),
              BottomMargin(24),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  width: double.infinity,
                  height: 48,
                ),
                child: GradientButton(
                  onPressed: controller.chagnePassword,
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      primaryP.shade800,
                      primaryP.shade400,
                    ],
                  ),
                  child: Text('Изменить'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
