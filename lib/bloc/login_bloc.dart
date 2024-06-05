import 'package:apex_mobile_test/core/di/di.dart';
import 'package:apex_mobile_test/core/models/login_model.dart';
import 'package:apex_mobile_test/core/repository/login_repository.dart';
import 'package:rxdart/subjects.dart';

// BLoC class for login
class LoginBloc {
  final loginRepo = getIt<LoginRepository>();
  final BehaviorSubject<LoginModel> _subject = BehaviorSubject();

  login(String email, String password) async {
    LoginModel response = await loginRepo.login(email, password);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<LoginModel> get subject => _subject;
}