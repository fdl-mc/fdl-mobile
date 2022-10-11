import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedomland/login/login.dart';
import 'package:user_repository/user_repository.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('логин типа'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(
          authRepository: context.read<AuthRepository>(),
          userRepository: context.read<UserRepository>(),
        ),
        child: const LoginForm(),
      ),
    );
  }
}
