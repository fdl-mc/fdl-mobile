import 'package:freedomland/controller/home_controller.dart';
import 'package:freedomland/controller/payement_controller.dart';
import 'package:freedomland/controller/user_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController(), permanent: true);
    Get.put<HomeController>(HomeController(), permanent: true);
    Get.lazyPut<PaymentController>(() => PaymentController());
  }
}
