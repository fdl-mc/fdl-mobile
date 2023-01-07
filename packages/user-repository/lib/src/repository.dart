import 'package:user_repository/user_repository.dart';
import 'package:users_service/api.dart' as oai;

class UserRepository {
  final String base;

  UserRepository({this.base = "https://api.fdl-mc.ru/users/v1"});

  oai.ApiClient _createApiClient({String? token}) {
    final auth = token == null ? null : oai.ApiKeyAuth('header', 'X-Token');
    auth?.apiKey = token!;

    return oai.ApiClient(basePath: base, authentication: auth);
  }

  oai.UsersApi _createUsersApi({String? token}) =>
      oai.UsersApi(_createApiClient(token: token));

  oai.AuthApi _createAuthApi({String? token}) =>
      oai.AuthApi(_createApiClient(token: token));

  Future<String> login({
    required String username,
    required String password,
  }) async {
    final res = await _createAuthApi().login(
      oai.LoginRequest(username: username, password: password),
    );

    return res!.token;
  }

  Future<User> getSelfUser({
    required String token,
  }) async {
    final res = await _createUsersApi(token: token).getSelf();

    return User.fromOai(res!);
  }
}
