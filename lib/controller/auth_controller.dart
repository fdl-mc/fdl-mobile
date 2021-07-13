import 'package:firebase_auth/firebase_auth.dart';
import 'package:freedomland/controller/bindings/home_binding.dart';
import 'package:freedomland/ui/home_page/home_page.dart';
import 'package:freedomland/ui/login_page.dart';
import 'package:freedomland/utils/build_snackbar.dart';
import 'package:freedomland/utils/snackbars.dart';
import 'package:get/get.dart';

class AuthController extends GetxService {
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
    print(username);
    print(password);
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: username + "@fdl.ru", password: password)
          .then((user) {
        Get.log('Signed in!');
        _handleAuthChange(user);
      });
    } catch (e) {
      print('SUS IMPOSTER: $e');
      showErrorSnackbar(
        title: "Ошибка",
        text: e.toString(),
      );
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      showErrorSnackbar(
        text: 'Ошибка выхода из аккаунта: ${e.toString()}',
      );
    }
  }

  Future<void> changePassword(
      String username, String oldPassword, String password) async {
    try {
      await login(username, oldPassword);
      await user?.updatePassword(password);
      showSuccessSnackbar(text: 'Пароль успешно изменён!');
    } catch (e) {
      print(e);
      showErrorSnackbar(
        text: 'Ошибка смены пароля: ${e.toString()}',
      );
    }
  }

  void _handleAuthChange(user) {
    if (user == null) {
      Get.offAll(() => LoginPage());
      // Get.offAllNamed('/login');
    } else {
      Get.offAll(() => HomePage(), binding: HomeBinding());
      // Get.offAllNamed('/home');
    }
  }
}
