import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tcf_dio/src/exceptions/network_exception.dart';
import 'package:tcf_dio/src/models/affiliate.dart';
import 'package:tcf_dio/src/models/athletes.dart';
import 'package:tcf_dio/src/models/movement.dart';
import 'package:tcf_dio/src/models/workouts.dart';
import 'package:tcf_dio/src/repositories/api_repository.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  /// backing field for the api service
  final ApiRepository apiRepository;

  AppCubit({@required this.apiRepository})
      : super(
          AthletesInitial(),
        );

  /// gets initial list of athletes limited to 25
  Future<void> getAthletes() async {
    try {
      emit(AthletesLoading());

      final athletes = await apiRepository.getAthletes().catchError(
            (error) => emit(AthletesError(errorMessage: error.toString())),
          );

      emit(AthletesLoaded(athletes: athletes));
    } on NetworkException catch (error) {
      emit(AthletesError(errorMessage: error.message));
    }
  }

  Future<void> getAffiliate() async {
    try {
      emit(AffiliateLoading());

      final affiliate = await apiRepository.getAffiliate().catchError(
            (error) => emit(AffiliateError(errorMessage: error.toString())),
          );

      emit(AffiliateLoaded(box: affiliate));
    } on NetworkException catch (error) {
      emit(AffiliateError(errorMessage: error.message));
    }
  }

  Future<void> getWorkouts() async {
    try {
      emit(WorkoutsLoading());

      final workouts = await apiRepository.getWorkouts().catchError(
            (error) => emit(WorkoutsError(errorMessage: error.toString())),
          );

      emit(WorkoutsLoaded(workouts: workouts));
    } on NetworkException catch (error) {
      emit(WorkoutsError(errorMessage: error.message));
    }
  }

  Future<void> getMovements({List<String> movementsId}) async {
    try {
      emit(MovementsLoading());

      List<Future<Movement>> futures = [];

      movementsId.forEach((element) {
        futures.add(apiRepository.getMovementById(element));
      });

      Future.wait(futures).then(((movement) async {
        emit(MovementsLoaded(movements: movement));
      }));
    } on NetworkException catch (error) {
      emit(MovementsError(errorMessage: error.message));
    }
  }
}
