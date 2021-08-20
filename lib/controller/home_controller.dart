import 'package:freedomland/controller/storage_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final storage = storageService;

  final _gradientIndex = 0.obs;
  get gradientIndex => _gradientIndex.value;

  final _box = GetStorage();

  @override
  Future<void> onInit() async {
    _gradientIndex.value = storage.read(
      'gradientIndex',
      defaultValue: 0,
    );

    _box.listenKey('gradientIndex', (value) {
      _gradientIndex.value = value;
    });
    super.onInit();
  }
}
