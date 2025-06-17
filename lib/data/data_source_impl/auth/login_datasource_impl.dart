import 'package:auvnet_task/core/services/supabase/supabase_helper.dart';
import 'package:auvnet_task/data/data_source_contract/auth/login_datasource.dart';
import 'package:auvnet_task/domain/common/result.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: LoginDataSource)
class LoginDataSourceImpl implements LoginDataSource {
  final SupabaseHelper supabaseHelper;
  @factoryMethod
  LoginDataSourceImpl(this.supabaseHelper);

  @override
  Future<Result<AuthResponse>> login(
      {required String email, required String password}) async {
    try {
      final AuthResponse response = await supabaseHelper.login(
        email: email,
        password: password,
      );

      return Success(response);
    } on AuthException catch (e) {
      return Error(Exception(e.message));
    } on PostgrestException catch (e) {
      return Error(Exception(e.message));
    } catch (e) {
      return Error(Exception('An unexpected error occurred: ${e.toString()}'));
    }
  }
}
