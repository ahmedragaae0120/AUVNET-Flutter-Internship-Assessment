import 'package:auvnet_task/data/data_source_contract/cache/popular_restaurant_local_data_source.dart';
import 'package:auvnet_task/data/model/popular_restaurant_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PopularRestaurantLocalDataSource)
class PopularRestaurantLocalDataSourceImpl
    implements PopularRestaurantLocalDataSource {
  final Box<PopularRestaurantModel> box;
  @factoryMethod
  PopularRestaurantLocalDataSourceImpl(
    @Named('popularBox') this.box,
  );

  @override
  Future<void> cacheRestaurants(
      List<PopularRestaurantModel> restaurants) async {
    try {
      await box.clear();
      await box.addAll(restaurants);
    } catch (e, stack) {
      print('Error caching restaurants: $e');
      print(stack);
      rethrow;
    }
  }

  @override
  List<PopularRestaurantModel> getCachedRestaurants() {
    try {
      return box.values.toList();
    } catch (e, stack) {
      print('Error reading cached restaurants: $e');
      print(stack);
      return [];
    }
  }
}
