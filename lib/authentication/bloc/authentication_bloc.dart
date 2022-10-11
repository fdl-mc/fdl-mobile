import 'dart:async';
import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  late final StreamSubscription<AuthStatus> _subscription;
  final AuthRepository _repository;

  AuthenticationBloc(this._repository)
      : super(const AuthenticationState.unknown()) {
    on<LogoutRequested>(_onLogoutRequested);
    on<AuthStatusChanged>(_onAuthStatusChanged);

    _subscription = _repository.status.listen(
      (status) => add(AuthStatusChanged(status: status)),
    );
  }

  Future<void> _onAuthStatusChanged(
    AuthStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    switch (event.status) {
      case AuthStatus.unknown:
        return emit(const AuthenticationState.unknown());
      case AuthStatus.authenticated:
        return emit(const AuthenticationState.authenticated());
      case AuthStatus.unauthenticated:
        return emit(const AuthenticationState.unauthenticated());
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    await _repository.deleteToken();
  }

  @override
  Future<void> close() async {
    _repository.dispose();
    super.close();
  }
}
