import 'package:flutter/material.dart';
import 'package:freedomland/controller/home_controller.dart';
import 'package:freedomland/controller/storage_service.dart';
import 'package:freedomland/controller/user_controller.dart';
import 'package:freedomland/ui/home_page/home_page_top_bar.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final userController = Get.find<UserController>();
  final homeController = Get.find<HomeController>();
  final storage = Get.find<StorageService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: userController.obx((state) {
      return RefreshIndicator(
        onRefresh: () async {
          await userController.fetchUser();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomePageTopBar(state: state!),
              Container(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Text(
                    'здесь должно быть море контента...\n...но автор ленивая жопа',
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }, onError: (error) {
      return Center(child: Text(error ?? 'неизвесн ащьбка'));
    }));
  }
}
