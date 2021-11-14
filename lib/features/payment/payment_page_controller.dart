import 'package:fdl_api/fdl_api.dart';
import 'package:fdl_app/features/auth/providers.dart';
import 'package:fdl_app/features/fdl_api/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final paymentPageControllerProvider = ChangeNotifierProvider(
  (ref) => PaymentPageController(ref),
);

class PaymentPageController extends ChangeNotifier {
  final ProviderReference _ref;
  PaymentPageController(this._ref);

  bool _isLoading = false;
  set isLoading(v) {
    _isLoading = v;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  User? user;
  int? amount;

  Future<List<User>> findUsers(String? query) async {
    if (query == null) return [];
    final res = await _ref.read(fdlApiProvider).findUsers(nickname: query);
    return res.toList();
  }

  Future<void> pay() async {
    await _ref.read(fdlApiProvider).pay(
          await _ref.read(currentUserProvider)!.getIdToken(),
          TransactionBuilder(amount: amount!, payee: user!.id),
        );
  }
}
