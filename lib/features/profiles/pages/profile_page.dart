import 'package:fdl_app/features/profiles/misc/providers.dart';
import 'package:fdl_app/shared/config.dart';
import 'package:fdl_app/shared/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class ProfilePage extends ConsumerWidget {
  final String id;
  const ProfilePage(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final state = watch(profilePageControllerProvider(id));

    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: state.when(data: (user) {
        return SafeArea(
          child: ListView(
            children: [
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 20.0,
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6.0),
                            child: Image.network(
                              'https://minotar.net/helm/${user.nickname}.png',
                              fit: BoxFit.cover,
                              width: 36,
                              height: 36,
                            ),
                          ),
                          const RSpacer(16),
                          Text(
                            user.nickname,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.payment),
                              ),
                              const RSpacer(12.0),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.gavel),
                              ),
                              const RSpacer(12.0),
                              IconButton(
                                onPressed: () {
                                  Clipboard.setData(
                                    ClipboardData(
                                      text: kBaseUrl.toString() +
                                          Routemaster.of(context)
                                              .currentRoute
                                              .path,
                                    ),
                                  ).then(
                                    (value) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            "Profile link copied to clipboard.",
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(Icons.copy),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const SizedBox(
                        height: double.infinity,
                        child: Icon(Icons.person),
                      ),
                      title: const Text('User ID'),
                      subtitle: Text(user.id),
                    ),
                    ListTile(
                      leading: const SizedBox(
                        height: double.infinity,
                        child: Icon(Icons.people),
                      ),
                      title: const Text('Discord ID'),
                      subtitle: Text(user.discordId),
                    ),
                    ListTile(
                      leading: const SizedBox(
                        height: double.infinity,
                        child: Icon(Icons.schedule),
                      ),
                      title: const Text('Registered at'),
                      subtitle: Text(user.createdAt.toString()),
                    ),
                    ListTile(
                      leading: const SizedBox(
                        height: double.infinity,
                        child: Icon(Icons.account_balance_wallet),
                      ),
                      title: const Text('Balance'),
                      subtitle: Text(user.balance.toString() + ' PF'),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }, loading: () {
        return const Center(child: CircularProgressIndicator());
      }, error: (err, stack) {
        return Center(child: Text(err.toString()));
      }),
    );
  }
}
