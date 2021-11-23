import 'package:appwrite/appwrite.dart';
import 'package:fdl_app/features/auth/auth_service.dart';
import 'package:fdl_app/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accountProvider = Provider<Account>(
  (ref) => Account(ref.read(appwriteProvider)),
);

final authServiceProvider = Provider(
  (ref) => AuthService(ref.read(appwriteProvider)),
);

final currentUserProvider = Provider(
  (ref) => ref.read(authServiceProvider).user,
);

final userStateProvider = StreamProvider(
  (ref) => ref.read(authServiceProvider).state,
);
