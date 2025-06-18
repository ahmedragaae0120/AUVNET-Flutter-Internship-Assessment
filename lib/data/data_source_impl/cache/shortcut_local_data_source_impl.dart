import 'package:auvnet_task/data/data_source_contract/cache/shortcut_local_data_source.dart';
import 'package:auvnet_task/data/model/shortcut_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ShortcutLocalDataSource)
class ShortcutLocalDataSourceImpl implements ShortcutLocalDataSource {
  final Box<ShortcutModel> box;
  @factoryMethod
  ShortcutLocalDataSourceImpl(
    @Named('shortcutBox') this.box,
  );

  @override
  Future<void> cacheShortcuts(List<ShortcutModel> shortcuts) async {
    try {
      await box.clear();
      await box.addAll(shortcuts);
    } catch (e, stack) {
      print('Failed to cache shortcuts: $e');
      print(stack);
      rethrow;
    }
  }

  @override
  List<ShortcutModel> getCachedShortcuts() {
    try {
      return box.values.toList();
    } catch (e, stack) {
      print('Failed to get cached shortcuts:$e');
      print(stack);
      return [];
    }
  }
}
