import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freedomland/controller/user_controller.dart';
import 'package:freedomland/provider/user_provider.dart';
import 'package:freedomland/utils/build_snackbar.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final usernameController = TextEditingController();
  final amountController = TextEditingController();

  final userController = Get.find<UserController>();
  final userProvider = Get.find<UserProvider>();

  final _fetching = false.obs;
  set fetching(bool v) => _fetching.value = v;
  bool get fetching => _fetching.value;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> pay() async {
    fetching = true;

    final payee = usernameController.value.text;
    final amount = int.tryParse(amountController.value.text)!;

    if ((payee.isBlank ?? false) || payee.length < 3) {
      Get.showSnackbar(
        buildSnackbar(
          title: 'Ошибка',
          text: 'Введите корректное имя пользователя',
          color: Colors.red,
          icon: Icons.error_outline,
        ),
      );
    } else if (amount < 0) {
      Get.showSnackbar(
        buildSnackbar(
          title: 'Ошибка',
          text: 'Введите корректную сумму',
          color: Colors.red,
          icon: Icons.error_outline,
        ),
      );
    } else if (amount > userController.state!.balance) {
      Get.showSnackbar(
        buildSnackbar(
          title: 'Ошибка',
          text: 'Недостаточно средств',
          color: Colors.red,
          icon: Icons.error_outline,
        ),
      );
    } else {
      final res =
          await userProvider.pay(userController.state!.uid, payee, amount);

      print(res.statusText);

      Get.showSnackbar(
        buildSnackbar(text: res.body ?? 'null'),
      );
    }

    fetching = false;
  }

  void clearValues() {
    usernameController.clear();
    amountController.clear();
  }
}
