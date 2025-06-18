import 'dart:developer';

import 'package:auvnet_task/core/network/network_info.dart';
import 'package:auvnet_task/data/model/service_model.dart';
import 'package:auvnet_task/domain/common/result.dart';
import 'package:auvnet_task/domain/repo_contract/cache/service_local_repo.dart';
import 'package:auvnet_task/domain/repo_contract/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetServicesUsecase {
  final HomeRepo homeRepo;
  final NetworkInfo networkInfo;
  final ServiceLocalRepo serviceLocalRepo;

  @factoryMethod
  GetServicesUsecase(this.homeRepo, this.networkInfo, this.serviceLocalRepo);

  Future<Result<List<ServiceModel>>> call() async {
    log("GetServicesUsecase");

    if (await networkInfo.isConnected) {
      log("GetServicesUsecase is connected");

      var result = await homeRepo.getServicesItem();
      if (result is Success<List<ServiceModel>>) {
        await serviceLocalRepo.cacheServices(result.data ?? []);
      }
      return result;
    } else {
      //not internet connection
      final cached = serviceLocalRepo.getCachedServices();
      if (cached.isNotEmpty) {
        return Success(cached);
      } else {
        return Error(Exception("No cached data and no internet connection"));
      }
    }
  }
}
