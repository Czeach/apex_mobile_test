import 'package:apex_mobile_test/core/di/di.dart';
import 'package:apex_mobile_test/core/models/verify_token_model.dart';
import 'package:apex_mobile_test/core/repository/verify_token_repository.dart';
import 'package:rxdart/subjects.dart';

// BLoC class for verifying token
class VerifyTokenBloc {
  final verifyTokenRepo = getIt<VerifyTokenRepository>();
  final BehaviorSubject<VerifyTokenModel> _subject = BehaviorSubject();

  verifyToken(String email, String token) async {
    VerifyTokenModel response = await verifyTokenRepo.verifyToken(email, token);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<VerifyTokenModel> get subject => _subject;
}