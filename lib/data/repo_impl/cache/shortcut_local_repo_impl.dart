import 'package:auvnet_task/data/data_source_contract/cache/shortcut_local_data_source.dart';
import 'package:auvnet_task/data/model/shortcut_model.dart';
import 'package:auvnet_task/domain/repo_contract/cache/shortcut_local_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ShortcutLocalRepo)
class ShortcutLocalRepoImpl implements ShortcutLocalRepo {
  ShortcutLocalDataSource shortcutLocalDataSource;
  @factoryMethod
  ShortcutLocalRepoImpl(this.shortcutLocalDataSource);
  @override
  Future<void> cacheShortcuts(List<ShortcutModel> shortcuts) async {
    return await shortcutLocalDataSource.cacheShortcuts(shortcuts);
  }

  @override
  List<ShortcutModel> getCachedShortcuts() {
    return shortcutLocalDataSource.getCachedShortcuts();
  }
}
