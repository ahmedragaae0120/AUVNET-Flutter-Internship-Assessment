import 'package:auvnet_task/data/data_source_contract/auth/signup_datasource.dart';
import 'package:auvnet_task/domain/common/result.dart';
import 'package:auvnet_task/domain/repo_contract/auth/signup_repo.dart';
import 'package:gotrue/src/types/auth_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignupRepo)
class SignupRepoImpl implements SignupRepo {
  SignupDatasource signupDatasource;
  @factoryMethod
  SignupRepoImpl(this.signupDatasource);
  @override
  Future<Result<AuthResponse>> createNewAccount(
      {required String email, required String password}) {
    return signupDatasource.createNewAccount(email: email, password: password);
  }
}
