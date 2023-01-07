import 'package:auth_repository/auth_repository.dart';
import 'package:economy_repository/economy_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedomland/home/view/cards/payment/cubit/payment_card_cubit.dart';
import 'package:freedomland/home/view/cards/payment/payment_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: const Text("Главная"),
            leading: IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              )
            ],
          ),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (context) => PaymentCardCubit(
                context.read<EconomyRepository>(),
                context.read<AuthRepository>(),
              )..fetch(),
              child: PaymentCard(),
            ),
          ),
          SliverFillRemaining(),
        ],
      ),
    );
  }
}
