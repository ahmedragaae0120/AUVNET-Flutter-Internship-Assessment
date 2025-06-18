import 'package:auvnet_task/data/model/shortcut_model.dart';

abstract class ShortcutLocalRepo {
  Future<void> cacheShortcuts(List<ShortcutModel> shortcuts);
  List<ShortcutModel> getCachedShortcuts();
}
