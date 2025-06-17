import 'package:auvnet_task/data/model/shortcut_model.dart';
import 'package:auvnet_task/domain/common/result.dart';
import 'package:auvnet_task/domain/repo_contract/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetShortcutsUsecase {
  final HomeRepo homeRepo;
  @factoryMethod
  GetShortcutsUsecase(this.homeRepo);

  Future<Result<List<ShortcutModel>>> call() async =>
      await homeRepo.getShortcuts();
}
