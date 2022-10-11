import 'dart:async';
import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository _repository;

  AuthenticationBloc(this._repository)
      : super(const AuthenticationState.unknown()) {
    on<Init>(_onInit);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
  }

  Future<void> _onInit(
    Init event,
    Emitter<AuthenticationState> emit,
  ) async {
    final token = await _repository.getToken();

    if (token == null) {
      emit(const AuthenticationState.unauthenticated());
    } else {
      emit(AuthenticationState.authenticated(token: token));
    }
  }

  Future<void> _onLoggedIn(
    LoggedIn event,
    Emitter<AuthenticationState> emit,
  ) async {
    await _repository.setToken(event.token);
    emit(AuthenticationState.authenticated(token: event.token));
  }

  Future<void> _onLoggedOut(
    LoggedOut event,
    Emitter<AuthenticationState> emit,
  ) async {
    await _repository.deleteToken();
    emit(const AuthenticationState.unauthenticated());
  }
}
