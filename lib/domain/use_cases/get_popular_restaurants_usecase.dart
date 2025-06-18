import 'dart:developer';

import 'package:auvnet_task/core/network/network_info.dart';
import 'package:auvnet_task/data/model/popular_restaurant_model.dart';
import 'package:auvnet_task/domain/common/result.dart';
import 'package:auvnet_task/domain/repo_contract/cache/popular_restaurant_local_repo.dart';
import 'package:auvnet_task/domain/repo_contract/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPopularRestaurantsUsecase {
  final HomeRepo homeRepo;
  final PopularRestaurantLocalRepo popularRestaurantLocalRepo;
  final NetworkInfo networkInfo;

  @factoryMethod
  GetPopularRestaurantsUsecase(
      this.homeRepo, this.networkInfo, this.popularRestaurantLocalRepo);

  Future<Result<List<PopularRestaurantModel>>> call() async {
    log("GetPopularRestaurantsUsecase");
    if (await networkInfo.isConnected) {
      var result = await homeRepo.getPopularRestaurants();
      log("GetPopularRestaurantsUsecase is connected");

      if (result is Success<List<PopularRestaurantModel>>) {
        await popularRestaurantLocalRepo.cacheRestaurants(result.data ?? []);
      }
      return result;
    } else {
      //not internet connection
      final cached = popularRestaurantLocalRepo.getCachedRestaurants();
      if (cached.isNotEmpty) {
        return Success(cached);
      } else {
        return Error(Exception("No cached data and no internet connection"));
      }
    }
  }
}
