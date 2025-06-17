import 'package:auvnet_task/data/model/popular_restaurant_model.dart';
import 'package:auvnet_task/data/model/service_model.dart';
import 'package:auvnet_task/data/model/shortcut_model.dart';
import 'package:auvnet_task/ui/Auth/view_model/bloc/auth_bloc.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  Status status;
  List<ServiceModel>? services;
  List<PopularRestaurantModel>? popularRestaurants;
  List<ShortcutModel>? shortcuts;
  Exception? exception;

  HomeState({
    required this.status,
    this.services,
    this.popularRestaurants,
    this.shortcuts,
    this.exception,
  });

  HomeState copyWith({
    Status? status,
    List<ServiceModel>? services,
    List<PopularRestaurantModel>? popularRestaurants,
    List<ShortcutModel>? shortcuts,
    Exception? exception,
  }) {
    return HomeState(
      status: status ?? this.status,
      services: services ?? this.services,
      popularRestaurants: popularRestaurants ?? this.popularRestaurants,
      shortcuts: shortcuts ?? this.shortcuts,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props =>
      [status, services, popularRestaurants, shortcuts, exception];
}
