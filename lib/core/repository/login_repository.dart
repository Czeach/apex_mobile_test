import 'dart:convert';

import 'package:apex_mobile_test/core/clients/login_client.dart';
import 'package:apex_mobile_test/core/di/di.dart';
import 'package:apex_mobile_test/core/models/login_model.dart';

abstract class LoginRepository {
  Future<LoginModel> login(String email, String password);
}

// repository to get login response and handle error
class LoginRepositoryImpl implements LoginRepository {
  final loginClient = getIt<LoginClient>();

  @override
  Future<LoginModel> login(String email, String password) async {
    try {
      final response = await loginClient.login(email, password);
      return LoginModel.fromJson(jsonDecode(response.body));
    } catch(e) {
      return LoginModel.withError('Something went wrong');
    }
  }
}