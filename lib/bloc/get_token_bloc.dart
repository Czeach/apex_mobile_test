import 'package:apex_mobile_test/core/di/di.dart';
import 'package:apex_mobile_test/core/models/get_token_model.dart';
import 'package:apex_mobile_test/core/repository/get_token_repository.dart';
import 'package:rxdart/subjects.dart';

// BLoC class for getting token
class GetTokenBloc {
  final getTokenRepo = getIt<GetTokenRepository>();
  final BehaviorSubject<GetTokenModel> _subject = BehaviorSubject();

  getToken(String email) async {
    GetTokenModel response = await getTokenRepo.getToken(email);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<GetTokenModel> get subject => _subject;
}