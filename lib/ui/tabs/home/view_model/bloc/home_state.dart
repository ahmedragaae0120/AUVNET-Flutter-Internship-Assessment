import 'package:auvnet_task/data/model/popular_restaurant_model.dart';
import 'package:auvnet_task/data/model/service_model.dart';
import 'package:auvnet_task/data/model/shortcut_model.dart';
import 'package:auvnet_task/ui/Auth/view_model/bloc/auth_bloc.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  Status servicesStatus;
  Status shortcutStatus;
  Status popularStatus;

  List<ServiceModel>? services;
  List<PopularRestaurantModel>? popularRestaurants;
  List<ShortcutModel>? shortcuts;
  Exception? exception;

  HomeState({
    required this.servicesStatus,
    required this.shortcutStatus,
    required this.popularStatus,
    this.services,
    this.popularRestaurants,
    this.shortcuts,
    this.exception,
  });

  HomeState copyWith({
    Status? servicesStatus,
    Status? shortcutStatus,
    Status? popularStatus,
    List<ServiceModel>? services,
    List<PopularRestaurantModel>? popularRestaurants,
    List<ShortcutModel>? shortcuts,
    Exception? exception,
  }) {
    return HomeState(
      servicesStatus: servicesStatus ?? this.servicesStatus,
      shortcutStatus: shortcutStatus ?? this.shortcutStatus,
      popularStatus: popularStatus ?? this.popularStatus,
      services: services ?? this.services,
      popularRestaurants: popularRestaurants ?? this.popularRestaurants,
      shortcuts: shortcuts ?? this.shortcuts,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [
        servicesStatus,
        shortcutStatus,
        popularStatus,
        services,
        popularRestaurants,
        shortcuts,
        exception,
      ];
}
