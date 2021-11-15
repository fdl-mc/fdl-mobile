import 'package:fdl_api/fdl_api.dart';
import 'package:fdl_app/shared/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fdlApiProvider = Provider<FdlApi>(
  (ref) => FdlApi(kApiUrl.host),
);
