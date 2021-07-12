import 'package:flutter/material.dart';
import 'package:freedomland/controller/user_controller.dart';
import 'package:freedomland/ui/home_page/home_page_top_bar.dart';
import 'package:get/get.dart';

class HomePage extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.obx((state) {
      return RefreshIndicator(
        onRefresh: () async {
          await controller.fetchUser();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomePageTopBar(state: state!),
            ],
          ),
        ),
      );
    }, onError: (error) {
      return Center(child: Text(error ?? 'неизвесн ащьбка'));
    }));
  }
}
