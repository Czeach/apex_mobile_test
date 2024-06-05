
import 'package:apex_mobile_test/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class LoginClient {
  Future<Response> login(String email, String password);
}

// network call for user login
class LoginClientImpl implements LoginClient {
  @override
  Future<Response> login(String email, String password) async {
    final url = Uri.parse('${Constants.baseUrl}/login');
    final headers = {'Accept': 'application/json'};
    final body = {
      'email': email,
      'password': password,
      'device_name': 'mobile'
    };

    final response = await http.post(url, headers: headers, body: body);

    return response;
  }
}