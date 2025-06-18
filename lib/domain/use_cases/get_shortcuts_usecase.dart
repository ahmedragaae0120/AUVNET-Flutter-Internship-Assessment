import 'dart:developer';

import 'package:auvnet_task/core/network/network_info.dart';
import 'package:auvnet_task/data/model/shortcut_model.dart';
import 'package:auvnet_task/domain/common/result.dart';
import 'package:auvnet_task/domain/repo_contract/cache/shortcut_local_repo.dart';
import 'package:auvnet_task/domain/repo_contract/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetShortcutsUsecase {
  final HomeRepo homeRepo;
  final NetworkInfo networkInfo;
  final ShortcutLocalRepo shortcutLocalRepo;
  @factoryMethod
  GetShortcutsUsecase(this.homeRepo, this.networkInfo, this.shortcutLocalRepo);

  Future<Result<List<ShortcutModel>>> call() async {
    log("GetShortcutsUsecase");
    if (await networkInfo.isConnected) {
      log("GetShortcutsUsecase is connected");
      var result = await homeRepo.getShortcuts();
      if (result is Success<List<ShortcutModel>>) {
        await shortcutLocalRepo.cacheShortcuts(result.data ?? []);
      }
      return result;
    } else {
      //not internet connection
      final cached = shortcutLocalRepo.getCachedShortcuts();
      if (cached.isNotEmpty) {
        return Success(cached);
      } else {
        return Error(Exception("No cached data and no internet connection"));
      }
    }
  }
}
