import 'package:auvnet_task/data/data_source_contract/home_datasource.dart';
import 'package:auvnet_task/data/model/popular_restaurant_model.dart';
import 'package:auvnet_task/data/model/service_model.dart';
import 'package:auvnet_task/data/model/shortcut_model.dart';
import 'package:auvnet_task/domain/common/result.dart';
import 'package:auvnet_task/domain/repo_contract/home_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeDataSource homeDataSource;
  @factoryMethod
  HomeRepoImpl(this.homeDataSource);
  @override
  Future<Result<List<PopularRestaurantModel>>> getPopularRestaurants() async {
    return await homeDataSource.getPopularRestaurants();
  }

  @override
  Future<Result<List<ServiceModel>>> getServicesItem() async {
    return await homeDataSource.getServicesItem();
  }

  @override
  Future<Result<List<ShortcutModel>>> getShortcuts() async {
    return await homeDataSource.getShortcuts();
  }
}
