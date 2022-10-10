import 'package:users_service/users.pb.dart' as pb;

class User {
  final int id;
  final String username;

  User({
    required this.id,
    required this.username,
  });

  factory User.fromMessage(pb.User msg) {
    return User(id: msg.id, username: msg.nickname);
  }
}
