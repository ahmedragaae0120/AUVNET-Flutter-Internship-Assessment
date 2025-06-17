import 'package:auvnet_task/core/services/supabase/supabase_helper.dart';
import 'package:auvnet_task/data/data_source_contract/auth/signup_datasource.dart';
import 'package:auvnet_task/domain/common/result.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: SignupDatasource)
class SignupDataSourceImpl implements SignupDatasource {
  final SupabaseHelper supabaseHelper;
  @factoryMethod
  SignupDataSourceImpl(this.supabaseHelper);
  @override
  Future<Result<AuthResponse>> createNewAccount({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse response = await supabaseHelper.createNewAccount(
        email: email,
        password: password,
      );

      if (response.user == null) {
        return Error(Exception(
            'Account creation failed. Please check your email and password.'));
      }

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
