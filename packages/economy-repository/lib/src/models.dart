import 'package:economy_service/api.dart' as oai;

class EconomyState {
  final int balance;

  EconomyState({
    required this.balance,
  });

  factory EconomyState.fromOai(oai.EconomyState state) =>
      EconomyState(balance: state.balance);
}
