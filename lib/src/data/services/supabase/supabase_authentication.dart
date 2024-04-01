import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthentication {
  final SupabaseClient client;

  SupabaseAuthentication({required this.client});

  Future<AuthResponse> signUp({required String email, required String password}) async {
    return await client.auth.signUp(
      password: password,
      email: email,
      data: {'email_confirm': '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}'},
    );
  }

  Future<AuthResponse> login({required String email, required String password}) async {
    return await client.auth.signInWithPassword(password: password, email: email);
  }

  Future<void> resetPassword({required String email}) async {
    return await client.auth.resetPasswordForEmail(email);
  }

  Session? checkUserAuthenticated() {
    return client.auth.currentSession;
  }
}
