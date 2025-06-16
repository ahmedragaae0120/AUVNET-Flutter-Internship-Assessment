import 'package:auvnet_task/Shared/observer/bloc_observer.dart';
import 'package:auvnet_task/my_app.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}
