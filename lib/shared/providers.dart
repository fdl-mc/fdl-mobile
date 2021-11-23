import 'package:appwrite/appwrite.dart';
import 'package:fdl_app/shared/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appwriteProvider = Provider<Client>(
  (ref) => Client()
    ..setEndpoint(kAppwriteEndpoint)
    ..setProject(kAppwriteId),
);
