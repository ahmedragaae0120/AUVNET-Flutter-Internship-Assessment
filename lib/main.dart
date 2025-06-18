import 'package:auvnet_task/Shared/observer/bloc_observer.dart';
import 'package:auvnet_task/core/Di/di.dart';
import 'package:auvnet_task/data/model/popular_restaurant_model.dart';
import 'package:auvnet_task/data/model/service_model.dart';
import 'package:auvnet_task/data/model/shortcut_model.dart';
import 'package:auvnet_task/my_app.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://snysvycdvhngpciyfpcj.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNueXN2eWNkdmhuZ3BjaXlmcGNqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAxNTgwNjcsImV4cCI6MjA2NTczNDA2N30.BaBfugLnDq4du-ddFhIzv0HPtW__0RSY58bedqJbsrc",
  );
  final dir = await getApplicationDocumentsDirectory();

  Hive.init(dir.path);
  Hive.registerAdapter(PopularRestaurantModelAdapter());
  Hive.registerAdapter(ServiceModelAdapter());
  Hive.registerAdapter(ShortcutModelAdapter());

  await Hive.openBox<PopularRestaurantModel>('popular_restaurants');
  await Hive.openBox<ServiceModel>('services');
  await Hive.openBox<ShortcutModel>('shortcuts');

  configureDependencies();

  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}
