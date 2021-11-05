import 'package:fdl_app/features/auth/misc/providers.dart';
import 'package:fdl_app/features/fdl_api/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final economy = watch(userEconomyProvider);
    return economy.when(
      data: (stats) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(stats.balance.toString()),
              ElevatedButton(
                onPressed: () => context.read(authServiceProvider).signOut(),
                child: Text(stats.balance.toString()),
              )
            ],
          ),
        ),
      ),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (err, trace) => Scaffold(
        body: Center(
          child: Text('Ошибка: $err'),
        ),
      ),
    );
  }
}
