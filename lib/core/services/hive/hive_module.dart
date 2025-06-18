import 'package:auvnet_task/data/model/service_model.dart';
import 'package:auvnet_task/data/model/shortcut_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:auvnet_task/data/model/popular_restaurant_model.dart';

@module
abstract class HiveModule {
  @lazySingleton
  @Named('popularBox')
  Box<PopularRestaurantModel> get popularRestaurantBox =>
      Hive.box<PopularRestaurantModel>('popular_restaurants');

  @lazySingleton
  @Named('serviceBox')
  Box<ServiceModel> get serviceBox => Hive.box<ServiceModel>('services');

  @lazySingleton
  @Named('shortcutBox')
  Box<ShortcutModel> get shortcutBox => Hive.box<ShortcutModel>('shortcuts');
}
