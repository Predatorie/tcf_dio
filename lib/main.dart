import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcf_dio/src/bloc/bloc_observer.dart';
import 'package:tcf_dio/src/branding.dart';
import 'package:tcf_dio/src/cubits/athletes_cubit.dart';
import 'package:tcf_dio/src/repositories/api_repository.dart';
import 'package:tcf_dio/src/views/athlete_page.dart';
import 'package:tcf_dio/src/views/athletes_page.dart';
import 'package:tcf_dio/src/views/home_page.dart';
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
  final _athletesCubit = AthletesCubit(apiRepository: ApiRespository());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SugarWOD Demo',
      theme: ThemeData().copyWith(primaryColor: tollandCrossFitBlue),
      routes: {
        '/': (context) => BlocProvider.value(
              child: HomePage(),
              value: _athletesCubit,
            ),
        AthletesPage.routeName: (context) => BlocProvider.value(
              child: AthletesPage(),
              value: _athletesCubit,
            ),
        AthletePage.routeName: (context) => BlocProvider.value(
              child: AthletePage(),
              value: _athletesCubit,
            ),
        WorkoutPage.routeName: (context) => BlocProvider.value(
              child: WorkoutPage(),
              value: _athletesCubit,
            )
      },
    );
  }

  @override
  void dispose() {
    _athletesCubit.close();
    super.dispose();
  }
}
