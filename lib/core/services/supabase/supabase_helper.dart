import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@singleton
class SupabaseHelper {
  final supabase = Supabase.instance.client;

  Future<AuthResponse> createNewAccount(
      {required String email, required String password}) async {
    return await supabase.auth.signUp(
      email: email,
      password: password,
    );
  }

  Future<AuthResponse> login(
      {required String email, required String password}) async {
    return await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<List<Map<String, dynamic>>> getServices() async {
    final response = await supabase
        .from('services')
        .select('*')
        .order('id', ascending: true);

    return response;
  }

  Future<List<Map<String, dynamic>>> getPopularRestaurants() async {
    final response = await supabase
        .from('popular_restaurants')
        .select('*')
        .order('id', ascending: true);

    return response;
  }

  Future<List<Map<String, dynamic>>> getShortcuts() async {
    final response = await supabase
        .from('shortcuts')
        .select('*')
        .order('id', ascending: true);

    return response;
  }
}
