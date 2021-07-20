import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  final _storage = GetStorage();

  read(String key, {dynamic defaultValue}) {
    var val = _storage.read(key);
    if (val == null && defaultValue != null) {
      _storage.write(key, defaultValue);
      return defaultValue;
    }

    return val;
  }

  void write(String key, dynamic value) {
    _storage.write(key, value);
  }

  void listenKey(String key, Function(dynamic) callback) {
    _storage.listenKey(key, callback);
  }
}
