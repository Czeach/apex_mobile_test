import 'dart:convert';

import 'package:apex_mobile_test/core/clients/get_token_client.dart';
import 'package:apex_mobile_test/core/di/di.dart';
import 'package:apex_mobile_test/core/models/get_token_model.dart';

abstract class GetTokenRepository {
  Future<GetTokenModel> getToken(String email);
}

// repository to retrieve get token response and handle error
class GetTokenRepositoryImpl implements GetTokenRepository {
  final getTokenClient = getIt<GetTokenClient>();

  @override
  Future<GetTokenModel> getToken(String email) async {
    try {
      final response = await getTokenClient.getToken(email);
      return GetTokenModel.fromJson(jsonDecode(response.body));
    } catch(e) {
      return GetTokenModel.withError('Something went wrong');
    }
  }
}