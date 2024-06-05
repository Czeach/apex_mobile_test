import 'package:apex_mobile_test/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class VerifyTokenClient {
  Future<Response> verifyToken(String email, String token);
}

// network call to verify user token
class VerifyTokenClientImpl implements VerifyTokenClient {

  @override
  Future<Response> verifyToken(String email, String token) async {
    final url = Uri.parse('${Constants.baseUrl}/email/verify');
    final headers = {'Accept': 'application/json'};
    final body = {'email': email, 'token': token};

    final response = await http.post(url, headers: headers, body: body);

    return response;
  }
}