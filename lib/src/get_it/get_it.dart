import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/services/supabase/supabase_authentication.dart';

final getIt = GetIt.instance;

void registerService() {
  getIt.registerSingleton<SupabaseClient>(Supabase.instance.client);
  getIt.registerFactory<SupabaseAuthentication>(() => SupabaseAuthentication(client: getIt.get<SupabaseClient>()));
}
