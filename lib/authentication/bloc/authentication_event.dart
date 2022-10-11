part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class Init extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}

class LoggedIn extends AuthenticationEvent {
  final String token;

  const LoggedIn({required this.token});

  @override
  List<Object?> get props => [token];
}

class LoggedOut extends AuthenticationEvent {
  const LoggedOut();

  @override
  List<Object?> get props => [];
}
