import 'package:economy_repository/economy_repository.dart';
import 'package:economy_service/api.dart' as oai;

class EconomyRepository {
  final String base;

  EconomyRepository({this.base = "https://api.fdl-mc.ru/economy/v1"});

  oai.ApiClient _createApiClient({String? token}) {
    final auth = token == null ? null : oai.ApiKeyAuth('header', 'X-Token');
    auth?.apiKey = token!;

    return oai.ApiClient(basePath: base, authentication: auth);
  }

  oai.EconomyStateApi _createEconomyStateApi({String? token}) =>
      oai.EconomyStateApi(_createApiClient(token: token));

  Future<EconomyState> getSelfEconomyState({
    required String token,
  }) async {
    final res = await _createEconomyStateApi(token: token).getSelf();
    return EconomyState.fromOai(res!);
  }

  Future<void> pay({
    required String token,
    required int payee,
    required int amount,
    String? comment,
  }) async {
    await _createEconomyStateApi(token: token).pay(
      payee.toString(),
      oai.DataPay(amount: amount, comment: comment),
    );
  }
}
