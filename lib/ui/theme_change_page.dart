import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:freedomland/constants/app_colors.dart';
import 'package:freedomland/controller/storage_service.dart';
import 'package:freedomland/ui/general/bottom_margin.dart';
import 'package:freedomland/ui/general/gradient_app_bar.dart';
import 'package:freedomland/ui/general/gradient_button.dart';
import 'package:freedomland/utils/app_color.dart';
import 'package:get/get.dart';

class ThemeChangePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text('Изменение темы'),
        gradient: getAppColorFromStorage().primaryGradient,
      ),
      body: Scrollbar(
        child: SafeArea(
          minimum: EdgeInsets.all(16),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemCount: appColors.length,
            itemBuilder: (context, index) => ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                width: double.infinity,
                height: 96,
              ),
              child: GradientButton(
                onPressed: () {
                  storageService.write('gradientIndex', index);
                  Phoenix.rebirth(context);
                },
                gradient: appColors[index].backgroundGradient,
                child: Text(
                  appColors[index].name,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            separatorBuilder: (context, index) => BottomMargin(16),
          ),
        ),
      ),
    );
  }
}
