import 'package:users_service/api.dart' as oai;

class User {
  final int id;
  final String username;

  User({
    required this.id,
    required this.username,
  });

  factory User.fromOai(oai.User user) {
    return User(id: user.id, username: user.nickname);
  }
}
