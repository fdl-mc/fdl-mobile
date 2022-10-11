import 'dart:developer';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:freedomland/login/login.dart';
import 'package:user_repository/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;
  final AuthRepository _authRepository;

  LoginBloc({
    required UserRepository userRepository,
    required AuthRepository authRepository,
  })  : _userRepository = userRepository,
        _authRepository = authRepository,
        super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  Future<void> _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) async {
    final username = Username.dirty(event.username);
    emit(
      state.copyWith(
        username: username,
        status: Formz.validate([state.password, username]),
      ),
    );
  }

  Future<void> _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) async {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([password, state.username]),
      ),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        final token = await _userRepository.login(
          username: state.username.value,
          password: state.password.value,
        );
        await _authRepository.setToken(token);
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (err) {
        log(err.toString());
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
