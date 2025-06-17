import 'package:auvnet_task/domain/common/result.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LoginDataSource {
  Future<Result<AuthResponse>> login(
      {required String email, required String password});
}
