import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/repositories/forgot_password.dart';
import '../data/repositories/login_repository.dart';
import '../data/repositories/register_repository.dart';
import '../data/repositories/splash_repository.dart';
import '../data/services/supabase/supabase_authentication.dart';
import '../ui/controller/forgot_password/forgot_password.dart';
import '../ui/controller/login/login_controller.dart';
import '../ui/controller/register/register_controller.dart';
import '../ui/controller/splash/splash.dart';

final getIt = GetIt.instance;

void registerService() {
  getIt.registerSingleton<SupabaseClient>(Supabase.instance.client);
  getIt.registerSingleton<SupabaseAuthentication>(SupabaseAuthentication(client: getIt.get<SupabaseClient>()));
  getIt.registerFactory<RegisterRepository>(() => RegisterRepository(authentication: getIt.get<SupabaseAuthentication>()));
  getIt.registerFactory<RegisterController>(() => RegisterController(repository: getIt.get<RegisterRepository>()));
  getIt.registerFactory<ForgotPasswordRepository>(() => ForgotPasswordRepository(authentication: getIt.get<SupabaseAuthentication>()));
  getIt.registerFactory<ForgotPasswordController>(() => ForgotPasswordController(repository: getIt.get<ForgotPasswordRepository>()));
  getIt.registerFactory<LoginRepository>(() => LoginRepository(authentication: getIt.get<SupabaseAuthentication>()));
  getIt.registerFactory<LoginController>(() => LoginController(repository: getIt.get<LoginRepository>()));
  getIt.registerFactory<SplashRepository>(() => SplashRepository(authentication: getIt.get<SupabaseAuthentication>()));
  getIt.registerFactory<SplashController>(() => SplashController(repository: getIt.get<SplashRepository>()));
}