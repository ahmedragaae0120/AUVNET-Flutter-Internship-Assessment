import 'package:auvnet_task/data/data_source_contract/cache/popular_restaurant_local_data_source.dart';
import 'package:auvnet_task/data/model/popular_restaurant_model.dart';
import 'package:auvnet_task/domain/repo_contract/cache/popular_restaurant_local_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PopularRestaurantLocalRepo)
class PopularRestaurantLocalRepoImpl implements PopularRestaurantLocalRepo {
  PopularRestaurantLocalDataSource popularRestaurantLocalDataSource;
  @factoryMethod
  PopularRestaurantLocalRepoImpl(this.popularRestaurantLocalDataSource);

  @override
  Future<void> cacheRestaurants(
      List<PopularRestaurantModel> restaurants) async {
    return await popularRestaurantLocalDataSource.cacheRestaurants(restaurants);
  }

  @override
  List<PopularRestaurantModel> getCachedRestaurants() {
    return popularRestaurantLocalDataSource.getCachedRestaurants();
  }
}
