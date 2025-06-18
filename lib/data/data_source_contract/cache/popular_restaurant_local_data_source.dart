import 'package:auvnet_task/data/model/popular_restaurant_model.dart';

abstract class PopularRestaurantLocalDataSource {
  Future<void> cacheRestaurants(List<PopularRestaurantModel> restaurants);
  List<PopularRestaurantModel> getCachedRestaurants();
}
