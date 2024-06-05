import 'package:apex_mobile_test/core/clients/get_token_client.dart';
import 'package:apex_mobile_test/core/clients/login_client.dart';
import 'package:apex_mobile_test/core/clients/register_client.dart';
import 'package:apex_mobile_test/core/clients/verify_token_client.dart';
import 'package:apex_mobile_test/core/repository/get_token_repository.dart';
import 'package:apex_mobile_test/core/repository/login_repository.dart';
import 'package:apex_mobile_test/core/repository/register_repository.dart';
import 'package:apex_mobile_test/core/repository/verify_token_repository.dart';
import 'package:get_it/get_it.dart';


// dependency injection using getIt

final getIt = GetIt.instance;

Future<void> init() async {
  
  // clients
  getIt.registerLazySingleton<GetTokenClient>(() => GetTokenClientImpl());
  getIt.registerLazySingleton<VerifyTokenClient>(() => VerifyTokenClientImpl());
  getIt.registerLazySingleton<RegisterClient>(() => RegisterClientImpl());
  getIt.registerLazySingleton<LoginClient>(() => LoginClientImpl());
  
  // repositories
  getIt.registerLazySingleton<GetTokenRepository>(() => GetTokenRepositoryImpl());
  getIt.registerLazySingleton<VerifyTokenRepository>(() => VerifyTokenRepositoryImpl());
  getIt.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl());
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());

}
