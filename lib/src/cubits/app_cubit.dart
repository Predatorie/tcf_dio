import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tcf_dio/src/exceptions/failures.dart';
import 'package:tcf_dio/src/models/affiliate.dart';
import 'package:tcf_dio/src/models/athletes.dart';
import 'package:tcf_dio/src/models/benchmarks.dart';
import 'package:tcf_dio/src/models/movement.dart';
import 'package:tcf_dio/src/models/workouts.dart';
import 'package:tcf_dio/src/repositories/api_repository.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  /// backing field for the api service
  final ApiRepository apiRepository;

  AppCubit({@required this.apiRepository})
      : super(
          AppInitial(),
        );

  /// gets initial list of athletes limited to 1000
  Future<void> getAthletes() async {
    emit(AthletesLoading());

    final athletes = await apiRepository.getAthletes();
    athletes.fold((l) {
      emit(
        AthletesError(errorMessage: l.toString()),
      );
    }, (r) {
      r.data.sort(
          (a, b) => a.attributes.lastName.compareTo(b.attributes.lastName));

      emit(AthletesLoaded(athletes: r));
    });
  }

  Future<void> getAffiliate() async {
    emit(AffiliateLoading());

    final affiliate = await apiRepository.getAffiliate();
    affiliate.fold(
        (l) => emit(
              AffiliateError(errorMessage: l.toString()),
            ),
        (r) => emit(AffiliateLoaded(box: r)));
  }

  /// gets a list of workouts
  Future<void> getWorkouts() async {
    emit(WorkoutsLoading());

    final workouts = await apiRepository.getWorkouts();
    workouts.fold(
        (l) => emit(
              WorkoutsError(errorMessage: l.toString()),
            ),
        (r) => emit(WorkoutsLoaded(workouts: r)));
  }

  /// gets a list of movements for a secific workout
  Future<void> getMovements({List<String> movementsId}) async {
    emit(MovementsLoading());

    List<Future<Either<Failure, Movement>>> futures = [];

    /// queue up our futures to run
    movementsId.forEach((element) {
      futures.add(apiRepository.getMovementById(element));
    });

    /// intialize list to hold results
    List<Movement> movements = [];
    final result = await Future.wait(futures);

    result.forEach((element) {
      element.fold((l) {
        emit(
          MovementsError(errorMessage: l.toString()),
        );
      }, (r) {
        movements.add(r);
      });
    });

    movements.sort(
        (a, b) => a.data.attributes.name.compareTo(b.data.attributes.name));
    emit(MovementsLoaded(movements: movements));
  }

  /// get a list of benchmarks for a specific category
  Future<void> getBenchmarksByCategory(String category) async {
    emit(BenchmarksLoading());

    final benchmarks = await apiRepository.getBenchmarksByCategory(category);
    benchmarks.fold((l) {
      emit(BenchmarksError(errorMessage: l.toString()));
    }, (r) {
      r.data.sort((a, b) => a.attributes.name.compareTo(b.attributes.name));

      emit(BenchmarksLoaded(benchmarks: r));
    });
  }
}
