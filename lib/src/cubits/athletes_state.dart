part of 'athletes_cubit.dart';

abstract class AthletesState extends Equatable {
  const AthletesState();
}

class AthletesInitial extends AthletesState {
  const AthletesInitial();
  @override
  List<Object> get props => [];
}

class AthletesLoading extends AthletesState {
  const AthletesLoading();
  @override
  List<Object> get props => [];
}

class AthletesLoaded extends AthletesState {
  final Athletes athletes;

  const AthletesLoaded({@required this.athletes});

  @override
  List<Object> get props => [athletes];
}

class AthletesError extends AthletesState {
  final String errorMessage;

  const AthletesError({@required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
