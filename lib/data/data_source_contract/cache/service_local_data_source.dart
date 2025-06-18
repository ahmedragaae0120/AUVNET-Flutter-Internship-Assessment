import 'package:auvnet_task/data/model/service_model.dart';

abstract class ServiceLocalDataSource {
  Future<void> cacheServices(List<ServiceModel> services);
  List<ServiceModel> getCachedServices();
}
