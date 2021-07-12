import 'package:firebase_auth/firebase_auth.dart';
import 'package:freedomland/controller/bindings/user_binding.dart';
import 'package:freedomland/ui/home_page/home_page.dart';
import 'package:freedomland/ui/login_page.dart';
import 'package:freedomland/utils/build_snackbar.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final _firebaseUser = FirebaseAuth.instance.currentUser.obs;
  User? get user => _firebaseUser.value;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
    // Get.testMode = true;

    _auth.authStateChanges().listen(_handleAuthChange);
  }

  Future<void> login(String username, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: username + "@fdl.ru", password: password)
          .then((user) {
        Get.log('Signed in!');
        _handleAuthChange(user);
      });
    } catch (e) {
      Get.snackbar("Ошибка", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      Get.showSnackbar(buildSnackbar(text: 'Ошибка выхода из аккаунта'));
    }
  }

  void _handleAuthChange(user) {
    if (user == null) {
      Get.offAll(() => LoginPage());
      // Get.offAllNamed('/login');
    } else {
      Get.offAll(() => HomePage(), binding: UserBinding());
      // Get.offAllNamed('/home');
    }
  }
}
