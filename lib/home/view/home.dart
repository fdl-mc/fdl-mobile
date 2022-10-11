import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedomland/authentication/authentication.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text(
              "втф фуги спустя полтора года????ого да я продуктивен !",
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthenticationBloc>().add(const LogoutRequested());
              },
              child: const Text('логаут бля'),
            )
          ],
        ),
      ),
    );
  }
}
