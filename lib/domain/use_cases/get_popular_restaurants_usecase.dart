import 'package:auvnet_task/data/model/popular_restaurant_model.dart';
import 'package:auvnet_task/domain/common/result.dart';
import 'package:auvnet_task/domain/repo_contract/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPopularRestaurantsUsecase {
  final HomeRepo homeRepo;
  @factoryMethod
  GetPopularRestaurantsUsecase(this.homeRepo);

  Future<Result<List<PopularRestaurantModel>>> call() async =>
      await homeRepo.getPopularRestaurants();
}
