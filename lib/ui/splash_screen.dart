import 'package:flutter/material.dart';
import 'package:freedomland/utils/app_color.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return getAppColorFromStorage().backgroundGradient.createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  );
            },
            child: Text(
              'FreedomLand',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
