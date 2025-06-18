import 'package:auvnet_task/data/model/popular_restaurant_model.dart';
import 'package:auvnet_task/data/model/service_model.dart';
import 'package:auvnet_task/data/model/shortcut_model.dart';
import 'package:auvnet_task/domain/common/result.dart';

abstract class HomeDataSource {
  Future<Result<List<ServiceModel>>> getServicesItem();
  Future<Result<List<PopularRestaurantModel>>> getPopularRestaurants();
  Future<Result<List<ShortcutModel>>> getShortcuts();
}
