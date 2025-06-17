import 'package:auvnet_task/data/model/service_model.dart';
import 'package:auvnet_task/domain/common/result.dart';
import 'package:auvnet_task/domain/repo_contract/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetServicesUsecase {
  final HomeRepo homeRepo;
  @factoryMethod
  GetServicesUsecase(this.homeRepo);

  Future<Result<List<ServiceModel>>> call() async =>
      await homeRepo.getServicesItem();
}
