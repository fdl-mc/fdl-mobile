import 'package:auth_repository/auth_repository.dart';
import 'package:economy_repository/economy_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_card_state.dart';

class PaymentCardCubit extends Cubit<PaymentCardState> {
  final EconomyRepository _economyRepository;
  final AuthRepository _authRepository;

  PaymentCardCubit(
    this._economyRepository,
    this._authRepository,
  ) : super(const PaymentCardLoading());

  Future<void> fetch() async {
    final token = (await _authRepository.getToken())!;
    try {
      final state = await _economyRepository.getSelfEconomyState(token: token);
      emit(PaymentCardSuccess(state));
    } catch (e) {
      print(e);
      emit(const PaymentCardError());
    }
  }
}
