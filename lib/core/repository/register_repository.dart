import 'dart:convert';

import 'package:apex_mobile_test/core/clients/register_client.dart';
import 'package:apex_mobile_test/core/di/di.dart';
import 'package:apex_mobile_test/core/models/register_model.dart';

abstract class RegisterRepository {
  Future<RegisterModel> register(String fullname, String username, String email,
      String country, String password);
}


// repository to get register response
class RegisterRepositoryImpl implements RegisterRepository {
  final registerClient = getIt<RegisterClient>();

  @override
  Future<RegisterModel> register(String fullname, String username, String email,
      String country, String password) async {
    try {
      final response = await registerClient.register(fullname, username, email, country, password);
      return RegisterModel.fromJson(jsonDecode(response.body));
    } catch(e) {
      return RegisterModel.withError('Something went wrong');
    }
  }
}