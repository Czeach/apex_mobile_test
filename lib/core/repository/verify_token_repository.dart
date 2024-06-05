import 'dart:convert';

import 'package:apex_mobile_test/core/clients/verify_token_client.dart';
import 'package:apex_mobile_test/core/di/di.dart';
import 'package:apex_mobile_test/core/models/verify_token_model.dart';

abstract class VerifyTokenRepository {
  Future<VerifyTokenModel> verifyToken(String email, String token);
}

// repository to verify token
class VerifyTokenRepositoryImpl implements VerifyTokenRepository {
  final verifyTokenClient = getIt<VerifyTokenClient>();

  @override
  Future<VerifyTokenModel> verifyToken(String email, String token) async {
    try {
      final response = await verifyTokenClient.verifyToken(email, token);
      return VerifyTokenModel.fromJson(jsonDecode(response.body));
    } catch(e) {
      return VerifyTokenModel.withError('Something went wrong');
    }
  }
}