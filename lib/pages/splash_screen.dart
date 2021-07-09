import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('FreedomLand',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
