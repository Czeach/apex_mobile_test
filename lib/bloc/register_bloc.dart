import 'package:apex_mobile_test/core/di/di.dart';
import 'package:apex_mobile_test/core/models/register_model.dart';
import 'package:apex_mobile_test/core/repository/register_repository.dart';
import 'package:rxdart/subjects.dart';

// BLoC class for register
class RegisterBloc {
  final registerRepo = getIt<RegisterRepository>();
  final BehaviorSubject<RegisterModel> _subject = BehaviorSubject();

  register(String fullname, String username, String email,
      String country, String password) async {
    RegisterModel response = await registerRepo.register(fullname, username, email, country, password);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<RegisterModel> get subject => _subject;
}