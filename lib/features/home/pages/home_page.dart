import 'package:fdl_app/features/home/misc/providers.dart';
import 'package:fdl_app/shared/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    // ignore: invalid_use_of_protected_member
    final controller = watch(homeControllerProvider);

    return controller.when(
      data: (user) => Scaffold(
        body: ListView(
          children: [
            Container(
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
                              fontSize: 18, color: _computeColor(context)
                              // color: Colors.white,
                              ),
                        ),
                        const Spacer(),
                        PopupMenuButton(
                          icon: Icon(
                            Icons.more_vert,
                            color: _computeColor(context),
                          ),
                          iconSize: 28,
                          onSelected: (s) {},
                          itemBuilder: (context) => [],
                        ),
                      ],
                    ),
                    const Space(24),
                    Text(
                      '${user.balance} PF',
                      style: TextStyle(
                        fontSize: 36,
                        color: _computeColor(context),
                      ),
                    ),
                    const Space(36),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _ActionButton(Icons.call_received, 'Deposit', () {}),
                        _ActionButton(Icons.call_made, 'Withdraw', () {}),
                        _ActionButton(Icons.payment, 'Payment',
                            () => Routemaster.of(context).push('/pay')),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
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
        const Space(10),
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
