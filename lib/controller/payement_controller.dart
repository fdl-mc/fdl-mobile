import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freedomland/controller/user_controller.dart';
import 'package:freedomland/provider/user_provider.dart';
import 'package:freedomland/utils/snackbars.dart';
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
    final amount = int.tryParse(
      amountController.value.text,
    );

    if (payee.length < 3) {
      showErrorSnackbar(
        title: 'Ошибка',
        text: 'Введите корректное имя пользователя',
      );
    } else if (amount == null || amount < 1) {
      showErrorSnackbar(
        title: 'Ошибка',
        text: 'Введите корректную сумму.',
      );
    } else if (amount > userController.state!.balance) {
      showErrorSnackbar(
        title: 'Ошибка',
        text: 'Недостаточно средств.',
      );
    } else {
      final res = await userProvider.pay(
        userController.state!.uid,
        payee,
        amount,
      );

      if (res.body == 'ok') {
        showSuccessSnackbar(
          text: 'Успешно переведено $amount ИБ пользователю $payee!',
        );
      } else if (res.body == 'user-not-found') {
        showErrorSnackbar(
          title: 'Ошибка',
          text: 'Пользователь не найден.',
        );
      } else {
        showErrorSnackbar(
          title: 'Непредвиденная ошибка',
          text: '(${res.statusCode}) ${res.body}',
        );
      }
    }

    userController.fetchUser();
    fetching = false;
  }

  void clearValues() {
    usernameController.clear();
    amountController.clear();
  }
}
