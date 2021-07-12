import 'package:flutter/material.dart';
import 'package:freedomland/ui/general/gradient_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/pallettes.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text('О приложении'),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[primaryP.shade800, primaryP.shade500]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Дизайнеры:',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            GestureDetector(
              onTap: () {
                launch('https://arslee.dev/');
              },
              child: Text(
                '@arslee',
                style: new TextStyle(color: Colors.blue, fontSize: 24),
              ),
            ),
            GestureDetector(
              onTap: () {
                launch('https://clmty.xyz/');
              },
              child: Text(
                '@Calamity34',
                style: new TextStyle(color: Colors.blue, fontSize: 24),
              ),
            ),
            GestureDetector(
              onTap: () {
                launch('https://igorek.dev/');
              },
              child: Text(
                '@Igorechek06',
                style: new TextStyle(color: Colors.blue, fontSize: 24),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 16)),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Back-end:',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            GestureDetector(
              onTap: () {
                launch('https://arslee.dev/');
              },
              child: Text(
                '@arslee',
                style: new TextStyle(color: Colors.blue, fontSize: 24),
              ),
            ),
            GestureDetector(
              onTap: () {
                launch('https://github.com/SergeyMC9730/');
              },
              child: Text(
                '@dogotrigger',
                style: new TextStyle(color: Colors.blue, fontSize: 24),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 16)),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'App-developer:',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            GestureDetector(
              onTap: () {
                launch('https://arslee.dev/');
              },
              child: Text(
                '@arslee',
                style: new TextStyle(color: Colors.blue, fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
