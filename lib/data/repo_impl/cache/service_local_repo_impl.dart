import 'package:auvnet_task/data/data_source_contract/cache/service_local_data_source.dart';
import 'package:auvnet_task/data/model/service_model.dart';
import 'package:auvnet_task/domain/repo_contract/cache/service_local_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ServiceLocalRepo)
class ServiceLocalRepoImpl implements ServiceLocalRepo {
  ServiceLocalDataSource serviceLocalDataSource;
  @factoryMethod
  ServiceLocalRepoImpl(this.serviceLocalDataSource);
  @override
  Future<void> cacheServices(List<ServiceModel> services) async {
    return await serviceLocalDataSource.cacheServices(services);
  }

  @override
  List<ServiceModel> getCachedServices() {
    return serviceLocalDataSource.getCachedServices();
  }
}
