import 'package:fdl_api/fdl_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fdlApiProvider = Provider<FdlApi>(
  (ref) => FdlApi('calamity34.ddns.net:3000'),
);
