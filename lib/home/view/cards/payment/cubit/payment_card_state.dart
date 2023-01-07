part of 'payment_card_cubit.dart';

abstract class PaymentCardState extends Equatable {
  const PaymentCardState();

  @override
  List<Object> get props => [];
}

class PaymentCardLoading extends PaymentCardState {
  const PaymentCardLoading();
}

class PaymentCardError extends PaymentCardState {
  const PaymentCardError();
}

class PaymentCardSuccess extends PaymentCardState {
  final EconomyState economyState;

  const PaymentCardSuccess(this.economyState);
}
