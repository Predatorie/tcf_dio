import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tcf_dio/src/models/athletes.dart';
import 'package:tcf_dio/src/repositories/api_repository.dart';

part 'athletes_state.dart';

class AthletesCubit extends Cubit<AthletesState> {
  /// backing field for the api service
  final ApiRespository apiRepository;

  AthletesCubit({@required this.apiRepository})
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
    } catch (error) {
      emit(AthletesError(errorMessage: error.toString()));
    }
  }
}
