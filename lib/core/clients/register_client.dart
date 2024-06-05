import 'package:apex_mobile_test/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class RegisterClient {
  Future<Response> register(String fullname, String username, String email,
      String country, String password);
}


// network call to register user
class RegisterClientImpl implements RegisterClient {
  @override
  Future<Response> register(String fullname, String username, String email,
      String country, String password) async {
    final url = Uri.parse('${Constants.baseUrl}/register');
    final headers = {'Accept': 'application/json'};
    final body = {
      'full_name': fullname,
      'username': username,
      'email': email,
      'country': country,
      'password': password,
      'device_name': 'mobile'
    };

    final response = await http.post(url, headers: headers, body: body);

    return response;
  }
}
