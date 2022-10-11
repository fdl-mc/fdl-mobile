part of 'authentication_bloc.dart';

@immutable
class AuthenticationState extends Equatable {
  final AuthStatus status;

  const AuthenticationState.authenticated() : status = AuthStatus.authenticated;

  const AuthenticationState.unauthenticated()
      : status = AuthStatus.unauthenticated;

  const AuthenticationState.unknown() : status = AuthStatus.unknown;

  @override
  List<Object?> get props => [status];
}
