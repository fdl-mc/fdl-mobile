part of 'authentication_bloc.dart';

enum AuthenticationStatus { unknown, unauthenticated, authenticated }

@immutable
class AuthenticationState extends Equatable {
  final AuthenticationStatus status;

  final String? token;

  const AuthenticationState.authenticated({required String this.token})
      : status = AuthenticationStatus.authenticated;

  const AuthenticationState.unauthenticated()
      : token = null,
        status = AuthenticationStatus.unauthenticated;

  const AuthenticationState.unknown()
      : token = null,
        status = AuthenticationStatus.unknown;

  @override
  List<Object?> get props => [status, token];
}
