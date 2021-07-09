import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freedomland/model/user_model.dart';

class UserProvider {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUserFromUid(String uid) async {
    try {
      CollectionReference users = _firestore.collection('users');
      DocumentSnapshot userSnapshot = await users.doc(uid).get();
      Map<String, dynamic> userData =
          userSnapshot.data() as Map<String, dynamic>;
      return UserModel.fromJson(userData);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
