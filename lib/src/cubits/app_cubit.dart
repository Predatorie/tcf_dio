import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tcf_dio/src/exceptions/network_exception.dart';
import 'package:tcf_dio/src/models/affiliate.dart';
import 'package:tcf_dio/src/models/athletes.dart';
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
}
