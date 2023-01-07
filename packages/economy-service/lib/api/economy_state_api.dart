//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of economy_service;


class EconomyStateApi {
  EconomyStateApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Add money
  ///
  /// Add money  Add money to target user. Bankers only. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Target user ID
  ///
  /// * [DataAddMoney] dataAddMoney (required):
  Future<Response> addMoneyWithHttpInfo(String id, DataAddMoney dataAddMoney,) async {
    // ignore: prefer_const_declarations
    final path = r'/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = dataAddMoney;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PATCH',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Add money
  ///
  /// Add money  Add money to target user. Bankers only. 
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Target user ID
  ///
  /// * [DataAddMoney] dataAddMoney (required):
  Future<void> addMoney(String id, DataAddMoney dataAddMoney,) async {
    final response = await addMoneyWithHttpInfo(id, dataAddMoney,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Fetch economy state
  ///
  /// Fetch economy state  Fetch economy state of user by their ID. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Target user ID
  Future<Response> getByIdWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Fetch economy state
  ///
  /// Fetch economy state  Fetch economy state of user by their ID. 
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Target user ID
  Future<EconomyState?> getById(String id,) async {
    final response = await getByIdWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'EconomyState',) as EconomyState;
    
    }
    return null;
  }

  /// Fetch self economy state
  ///
  /// Fetch self economy state  Fetch your economy state data. 
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getSelfWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/me';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Fetch self economy state
  ///
  /// Fetch self economy state  Fetch your economy state data. 
  Future<EconomyState?> getSelf() async {
    final response = await getSelfWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'EconomyState',) as EconomyState;
    
    }
    return null;
  }

  /// Pay
  ///
  /// Pay  Pay money to other player. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Payee user ID
  ///
  /// * [DataPay] dataPay (required):
  Future<Response> payWithHttpInfo(String id, DataPay dataPay,) async {
    // ignore: prefer_const_declarations
    final path = r'/{id}/pay'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = dataPay;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Pay
  ///
  /// Pay  Pay money to other player. 
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Payee user ID
  ///
  /// * [DataPay] dataPay (required):
  Future<void> pay(String id, DataPay dataPay,) async {
    final response = await payWithHttpInfo(id, dataPay,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
