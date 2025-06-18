import 'package:auvnet_task/data/model/shortcut_model.dart';

abstract class ShortcutLocalDataSource {
  Future<void> cacheShortcuts(List<ShortcutModel> shortcuts);
  List<ShortcutModel> getCachedShortcuts();
}
