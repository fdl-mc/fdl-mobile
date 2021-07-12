import 'package:firebase_auth/firebase_auth.dart';
import 'package:freedomland/model/user_model.dart';
import 'package:freedomland/provider/user_provider.dart';
import 'package:get/get.dart';

class UserController extends GetxController with StateMixin<UserModel> {
  final userProvider = Get.find<UserProvider>();
  final _firebase = FirebaseAuth.instance;

  Future<void> fetchUser() async {
    try {
      final user =
          await userProvider.getUserFromUid(_firebase.currentUser!.uid);
      change(user, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  Future<void> pay() async {}

  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }
}
