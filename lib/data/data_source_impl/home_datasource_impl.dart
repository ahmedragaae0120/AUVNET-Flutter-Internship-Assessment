import 'package:auvnet_task/core/services/supabase/supabase_helper.dart';
import 'package:auvnet_task/data/data_source_contract/home_datasource.dart';
import 'package:auvnet_task/data/model/popular_restaurant_model.dart';
import 'package:auvnet_task/data/model/service_model.dart';
import 'package:auvnet_task/data/model/shortcut_model.dart';
import 'package:auvnet_task/domain/common/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeDataSource)
class HomeDatasourceImpl implements HomeDataSource {
  final SupabaseHelper supabaseHelper;
  @factoryMethod
  HomeDatasourceImpl(this.supabaseHelper);
  @override
  Future<Result<List<PopularRestaurantModel>>> getPopularRestaurants() async {
    try {
      var response = await supabaseHelper.getPopularRestaurants();
      List<PopularRestaurantModel> popularRestaurants =
          response.map((e) => PopularRestaurantModel.fromJson(e)).toList();
      return Success(popularRestaurants);
    } catch (e) {
      return Error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<List<ServiceModel>>> getServicesItem() async {
    try {
      var response = await supabaseHelper.getServices();
      List<ServiceModel> serviceList =
          response.map((e) => ServiceModel.fromJson(e)).toList();
      return Success(serviceList);
    } catch (e) {
      return Error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<List<ShortcutModel>>> getShortcuts() async {
    try {
      var response = await supabaseHelper.getShortcuts();
      List<ShortcutModel> shortcutList =
          response.map((e) => ShortcutModel.fromJson(e)).toList();
      return Success(shortcutList);
    } catch (e) {
      return Error(Exception(e.toString()));
    }
  }
}
