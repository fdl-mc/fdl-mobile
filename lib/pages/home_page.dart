import 'package:flutter/material.dart';
import 'package:freedomland/pages/about_page.dart';
import 'package:get/get.dart';

import '../pallettes.dart';

enum SelectedPage { settings, about }

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
              padding: const EdgeInsets.only(
                  top: 38, bottom: 32, left: 18, right: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ClipOval(
                              child: Image.network(
                                'https://i.imgur.com/xXSxuQB.gif',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            )),
                        Text(
                          'PlatnoGaming1337',
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
                    '32 фуги',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 56,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              elevation: 8,
                              shape: CircleBorder(),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.add,
                                  size: 32,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Пополнить',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              elevation: 8,
                              shape: CircleBorder(),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.remove,
                                  size: 32,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Снять со счета',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              elevation: 8,
                              shape: CircleBorder(),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.payment_outlined,
                                  size: 32,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Перевести',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
