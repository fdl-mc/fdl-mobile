import 'package:flutter/material.dart';
import 'package:freedomland/controller/user_controller.dart';
import 'package:freedomland/pages/about_page.dart';
import 'package:get/get.dart';

import '../constants/pallettes.dart';

enum SelectedPage { settings, about }

class HomePage extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.obx((state) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  boxShadow: kElevationToShadow[6],
                  borderRadius: BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(16),
                      bottomStart: Radius.circular(16)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [secondaryP.shade400, primaryP.shade400])),
              child: Padding(
                padding:
                    EdgeInsets.only(top: 38, bottom: 32, left: 18, right: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: ClipOval(
                                child: Image.network(
                                  'https://minotar.net/helm/${state!.name}.png',
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                              )),
                          Text(
                            state.name,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Spacer(),
                          PopupMenuButton<SelectedPage>(
                            icon: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                            iconSize: 28,
                            onSelected: (SelectedPage sp) {
                              switch (sp) {
                                case SelectedPage.settings:
                                  // TODO: handle
                                  break;
                                case SelectedPage.about:
                                  Get.to(() => AboutPage());
                                  break;
                              }
                            },
                            itemBuilder: (BuildContext context) => [
                              PopupMenuItem(
                                child: Text('Настройки'),
                                value: SelectedPage.settings,
                              ),
                              PopupMenuItem(
                                child: Text('О приложении'),
                                value: SelectedPage.about,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'В кошельке',
                      style: TextStyle(
                          color: Color.fromARGB(190, 255, 255, 255),
                          fontSize: 20),
                    ),
                    Text(
                      '${state.balance} ИБ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 56,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildActionButton(Icons.add, 'Пополнить', () {}),
                          buildActionButton(
                              Icons.remove, 'Снять со счета', () {}),
                          buildActionButton(
                              Icons.payment_outlined, 'Перевести', () {}),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }, onError: (error) {
      return Center(child: Text(error ?? 'ащьбка'));
    }));
  }

  Widget buildActionButton(
      IconData icon, String title, void Function() onPressed) {
    return Column(
      children: [
        MaterialButton(
          onPressed: onPressed,
          elevation: 8,
          shape: CircleBorder(),
          color: Colors.white,
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
