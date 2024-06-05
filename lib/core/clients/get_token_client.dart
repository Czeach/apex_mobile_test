import 'package:apex_mobile_test/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class GetTokenClient {
  Future<Response> getToken(String email);
}

// network call to get token
class GetTokenClientImpl implements GetTokenClient {

  @override
  Future<Response> getToken(String email) async {
    final url = Uri.parse('${Constants.baseUrl}/email');
    final headers = {'Accept': 'application/json'};
    final body = {'email': email};

    final response = await http.post(url, headers: headers, body: body);

    return response;
  }
}