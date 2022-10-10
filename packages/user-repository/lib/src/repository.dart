import 'package:user_repository/user_repository.dart';
import 'package:users_service/users.pbgrpc.dart' as pb;
import 'package:grpc/grpc.dart';

class UserRepository {
  late final pb.UsersClient _client;

  UserRepository({
    String host = "api.fdl-mc.ru",
    int port = 443,
  }) {
    final channel = ClientChannel(host, port: port);
    _client = pb.UsersClient(channel);
  }

  Future<String> login({
    required String username,
    required String password,
  }) async {
    final reply = await _client.login(
      pb.LoginRequest(
        username: username,
        password: password,
      ),
    );

    return reply.token;
  }

  Future<User> getSelfUser({
    required String token,
  }) async {
    final reply = await _client.getSelfUser(
      pb.GetSelfUserRequest(),
      options: CallOptions(
        metadata: {'Authentication': token},
      ),
    );

    return User.fromMessage(reply.user);
  }
}
