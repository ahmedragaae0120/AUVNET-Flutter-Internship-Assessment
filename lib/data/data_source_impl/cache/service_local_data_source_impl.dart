import 'package:auvnet_task/data/data_source_contract/cache/service_local_data_source.dart';
import 'package:auvnet_task/data/model/service_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ServiceLocalDataSource)
class ServiceLocalDataSourceImpl implements ServiceLocalDataSource {
  final Box<ServiceModel> box;
  @factoryMethod
  ServiceLocalDataSourceImpl(
    @Named('serviceBox') this.box,
  );

  @override
  Future<void> cacheServices(List<ServiceModel> services) async {
    try {
      await box.clear();
      await box.addAll(services);
    } catch (e, stack) {
      print('Failed to cache services: $e');
      print(stack);
      rethrow;
    }
  }

  @override
  List<ServiceModel> getCachedServices() {
    try {
      return box.values.toList();
    } catch (e, stack) {
      print('Failed to get cached services: $e');
      print(stack);
      return [];
    }
  }
}
