import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcf_dio/src/bloc/bloc_observer.dart';
import 'package:tcf_dio/src/branding.dart';
import 'package:tcf_dio/src/cubits/app_cubit.dart';
import 'package:tcf_dio/src/repositories/api_repository.dart';
import 'package:tcf_dio/src/views/athlete_page.dart';
import 'package:tcf_dio/src/views/athletes_page.dart';
import 'package:tcf_dio/src/views/benchmarks_page.dart';
import 'package:tcf_dio/src/views/home_page.dart';
import 'package:tcf_dio/src/views/movements_page.dart';
import 'package:tcf_dio/src/views/workout_page.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appCubit = AppCubit(apiRepository: ApiRepository());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SugarWOD Demo',
      theme: ThemeData().copyWith(primaryColor: tollandCrossFitBlue),
      routes: {
        '/': (context) => BlocProvider.value(
              child: HomePage(),
              value: _appCubit,
            ),
        AthletesPage.routeName: (context) => BlocProvider.value(
              child: AthletesPage(),
              value: _appCubit,
            ),
        AthletePage.routeName: (context) => BlocProvider.value(
              child: AthletePage(),
              value: _appCubit,
            ),
        WorkoutPage.routeName: (context) => BlocProvider.value(
              child: WorkoutPage(),
              value: _appCubit,
            ),
        MovementsPage.routeName: (context) => BlocProvider.value(
              child: MovementsPage(),
              value: _appCubit,
            ),
        BenchmarksPage.routeName: (context) => BlocProvider.value(
              child: BenchmarksPage(),
              value: _appCubit,
            ),
      },
    );
  }

  @override
  void dispose() {
    _appCubit.close();
    super.dispose();
  }
}
