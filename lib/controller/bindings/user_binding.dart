import 'package:freedomland/controller/payement_controller.dart';
import 'package:freedomland/controller/user_controller.dart';
import 'package:get/get.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController());
    Get.lazyPut<PaymentController>(() => PaymentController());
  }
}
