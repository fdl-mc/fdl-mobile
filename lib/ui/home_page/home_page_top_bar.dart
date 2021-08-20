import 'package:flutter/material.dart';
import 'package:freedomland/constants/enums.dart';
import 'package:freedomland/controller/bindings/settings_binding.dart';
import 'package:freedomland/controller/payement_controller.dart';
import 'package:freedomland/model/user_model.dart';
import 'package:freedomland/ui/payment_sheet.dart';
import 'package:freedomland/ui/settings_page.dart';
import 'package:freedomland/utils/app_color.dart';
import 'package:freedomland/utils/build_snackbar.dart';
import 'package:get/get.dart';

class HomePageTopBar extends StatelessWidget {
  final UserModel state;

  const HomePageTopBar({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: kElevationToShadow[6],
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(16),
          bottomStart: Radius.circular(16),
        ),
        gradient: getAppColorFromStorage().backgroundGradient,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 38, bottom: 32, left: 18, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          'https://minotar.net/helm/${state.name}.png',
                          width: 32,
                          height: 32,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Text(
                    state.name,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Spacer(),
                  PopupMenuButton<SelectedSection>(
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    iconSize: 28,
                    onSelected: (SelectedSection ss) {
                      switch (ss) {
                        case SelectedSection.settings:
                          SettingsBinding().dependencies();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => SettingsPage()),
                          );
                          // Get.to(
                          //   () => SettingsPage(),
                          //   binding: SettingsBinding(),
                          // );
                          break;
                        case SelectedSection.about:
                          // Get.to(() => AboutPage());
                          showAboutDialog(
                            context: context,
                            applicationName: "FreedomLand",
                            applicationLegalese:
                                "Официальное приложение для Minecraft-сервера Freedomland.",
                            applicationIcon: Image.asset(
                              'assets/icon.png',
                              width: 32,
                              height: 32,
                            ),
                            applicationVersion: '0.0.1a',
                          );
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        child: Text('Настройки'),
                        value: SelectedSection.settings,
                      ),
                      PopupMenuItem(
                        child: Text('О приложении'),
                        value: SelectedSection.about,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              'В кошельке',
              style: TextStyle(
                  color: Color.fromARGB(190, 255, 255, 255), fontSize: 20),
            ),
            RichText(
              text: TextSpan(
                text: '${state.balance}',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 56,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: ' ИБ',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 52,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildActionButton(Icons.add, 'Пополнить', () {
                    Get.showSnackbar(buildSnackbar(text: 'скоро бля'));
                  }),
                  buildActionButton(Icons.remove, 'Снять со счета', () {
                    Get.showSnackbar(buildSnackbar(text: 'скоро бля'));
                  }),
                  buildActionButton(Icons.payment_outlined, 'Перевести', () {
                    Get.bottomSheet(
                      PaymentSheet(),
                      ignoreSafeArea: false,
                    ).then((value) {
                      Get.find<PaymentController>().clearValues();
                    });
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildActionButton(
      IconData icon, String title, void Function() onPressed) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            primary: Colors.white,
            // onSurface: Colors.black,
            onPrimary: Colors.black,
            elevation: 16,
          ),
          // elevation: 8,
          // color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              icon,
              size: 32,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
