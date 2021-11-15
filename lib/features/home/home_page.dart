import 'package:fdl_api/fdl_api.dart';
import 'package:fdl_app/features/auth/providers.dart';
import 'package:fdl_app/features/home/providers.dart';
import 'package:fdl_app/shared/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final controller = watch(homeControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: controller.refresh,
          child: controller.user.when(
            data: (user) => ListView(
              children: [_Header(user)],
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (err, trace) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text('Ошибка: $err'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final User user;
  const _Header(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: kElevationToShadow[4],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 32,
          left: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    final id = context.read(currentUserProvider)!.uid;
                    Routemaster.of(context).push('/profile/$id');
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.network(
                            'https://minotar.net/helm/${user.nickname}.png',
                            width: 28,
                            height: 28,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        user.nickname,
                        style: TextStyle(
                          fontSize: 18,
                          color: _computeColor(context),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                PopupMenuButton<int>(
                  icon: Icon(
                    Icons.more_vert,
                    color: _computeColor(context),
                  ),
                  iconSize: 28,
                  onSelected: (s) {
                    switch (s) {
                      case 0:
                        Routemaster.of(context).push('/settings');
                        break;
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(child: Text('Settings'), value: 0),
                  ],
                ),
              ],
            ),
            const BSpacer(24),
            Text(
              '${user.balance} PF',
              style: TextStyle(
                fontSize: 36,
                color: _computeColor(context),
              ),
            ),
            const BSpacer(36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ActionButton(
                  Icons.call_received,
                  'Deposit',
                  () {},
                ),
                _ActionButton(
                  Icons.call_made,
                  'Withdraw',
                  () {},
                ),
                _ActionButton(
                  Icons.payment,
                  'Payment',
                  () => Routemaster.of(context).push('/pay'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function() onPressed;
  const _ActionButton(this.icon, this.text, this.onPressed, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          child: Icon(icon, color: _computeColor(context)),
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(48, 255, 255, 255),
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(18),
            shadowColor: Colors.transparent,
          ),
        ),
        const BSpacer(10),
        Text(
          text,
          style: TextStyle(color: _computeColor(context)),
        ),
      ],
    );
  }
}

Color _computeColor(BuildContext context) =>
    Theme.of(context).primaryColor.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;
