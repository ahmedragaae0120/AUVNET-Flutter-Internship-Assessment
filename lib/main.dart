import 'package:auvnet_task/Shared/observer/bloc_observer.dart';
import 'package:auvnet_task/my_app.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://snysvycdvhngpciyfpcj.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNueXN2eWNkdmhuZ3BjaXlmcGNqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAxNTgwNjcsImV4cCI6MjA2NTczNDA2N30.BaBfugLnDq4du-ddFhIzv0HPtW__0RSY58bedqJbsrc",
  );
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}
