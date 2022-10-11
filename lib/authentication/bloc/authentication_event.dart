part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class AuthStatusChanged extends AuthenticationEvent {
  final AuthStatus status;

  const AuthStatusChanged({required this.status});

  @override
  List<Object?> get props => [status];
}

class LogoutRequested extends AuthenticationEvent {
  const LogoutRequested();

  @override
  List<Object?> get props => [];
}
