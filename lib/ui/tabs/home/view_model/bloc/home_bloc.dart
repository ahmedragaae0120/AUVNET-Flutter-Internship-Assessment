import 'package:auvnet_task/domain/common/result.dart';
import 'package:auvnet_task/domain/use_cases/get_popular_restaurants_usecase.dart';
import 'package:auvnet_task/domain/use_cases/get_services_usecase.dart';
import 'package:auvnet_task/domain/use_cases/get_shortcuts_usecase.dart';
import 'package:auvnet_task/ui/Auth/view_model/bloc/auth_bloc.dart';
import 'package:auvnet_task/ui/tabs/home/view_model/bloc/home_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetPopularRestaurantsUsecase getPopularRestaurantsUsecase;
  final GetServicesUsecase getServicesUsecase;
  final GetShortcutsUsecase getShortcutsUsecase;
  HomeBloc(this.getPopularRestaurantsUsecase, this.getServicesUsecase,
      this.getShortcutsUsecase)
      : super(HomeState(
          servicesStatus: Status.initial,
          shortcutStatus: Status.initial,
          popularStatus: Status.initial,
        )) {
    on<HomeEvent>((event, emit) {});
  }

  static HomeBloc get(context) => BlocProvider.of<HomeBloc>(context);

  getPopularRestaurants() async {
    emit(state.copyWith(
      popularStatus: Status.loading,
    ));
    var result = await getPopularRestaurantsUsecase.call();
    switch (result) {
      case Success():
        emit(state.copyWith(
          popularStatus: Status.popular,
          popularRestaurants: result.data,
        ));
        break;
      case Error():
        emit(state.copyWith(
            popularStatus: Status.error, exception: result.exception));
        break;
    }
  }

  getServices() async {
    emit(state.copyWith(
      servicesStatus: Status.loading,
    ));
    var result = await getServicesUsecase.call();
    switch (result) {
      case Success():
        emit(state.copyWith(
          servicesStatus: Status.services,
          services: result.data,
        ));
        break;
      case Error():
        emit(state.copyWith(
            servicesStatus: Status.error, exception: result.exception));
        break;
    }
  }

  getShortcuts() async {
    emit(state.copyWith(
      popularStatus: Status.loading,
    ));
    var result = await getShortcutsUsecase.call();
    switch (result) {
      case Success():
        emit(state.copyWith(
          shortcutStatus: Status.shortcut,
          shortcuts: result.data,
        ));
        break;
      case Error():
        emit(state.copyWith(
            shortcutStatus: Status.error, exception: result.exception));
        break;
    }
  }
}
