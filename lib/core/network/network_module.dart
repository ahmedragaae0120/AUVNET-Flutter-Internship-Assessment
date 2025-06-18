import 'package:auvnet_task/core/network/network_info.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  NetworkInfo get networkInfo => NetworkInfoImpl();
}
