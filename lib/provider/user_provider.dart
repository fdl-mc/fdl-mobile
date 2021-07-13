import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freedomland/model/user_model.dart';
import 'package:get/get_connect/connect.dart';

class UserProvider extends GetConnect {
  UserProvider() {
    this.baseUrl = 'http://igorechek.ddns.net:3000/';
  }

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUserFromUid(String uid) async {
    try {
      CollectionReference users = _firestore.collection('users');
      DocumentSnapshot userSnapshot = await users.doc(uid).get();
      return UserModel.fromDocumentSnapshot(userSnapshot);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Response<String>> pay(String payer, String payee, int amount) async {
    return await get('pay?payer=$payer&payee=$payee&amount=$amount');
  }
}
