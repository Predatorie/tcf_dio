part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  const AppState();
}

// Athletes
class AthletesInitial extends AppState {
  const AthletesInitial();
  @override
  List<Object> get props => [];
}

class AthletesLoading extends AppState {
  const AthletesLoading();
  @override
  List<Object> get props => [];
}

class AthletesLoaded extends AppState {
  final Athletes athletes;

  const AthletesLoaded({@required this.athletes});

  @override
  List<Object> get props => [athletes];
}

class AthletesError extends AppState {
  final String errorMessage;

  const AthletesError({@required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

// Affiliate
class AffiliateLoading extends AppState {
  const AffiliateLoading();
  @override
  List<Object> get props => [];
}

class AffiliateLoaded extends AppState {
  final Box box;

  const AffiliateLoaded({@required this.box});

  @override
  List<Object> get props => [box];
}

class AffiliateError extends AppState {
  final String errorMessage;

  const AffiliateError({@required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class WorkoutsLoading extends AppState {
  const WorkoutsLoading();
  @override
  List<Object> get props => [];
}

class WorkoutsLoaded extends AppState {
  final Workouts workouts;

  const WorkoutsLoaded({@required this.workouts});

  @override
  List<Object> get props => [workouts];
}

class WorkoutsError extends AppState {
  final String errorMessage;

  const WorkoutsError({@required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class MovementsLoading extends AppState {
  const MovementsLoading();
  @override
  List<Object> get props => [];
}

class MovementsLoaded extends AppState {
  final List<Movement> movements;

  const MovementsLoaded({@required this.movements});

  @override
  List<Object> get props => [movements];
}

class MovementsError extends AppState {
  final String errorMessage;

  const MovementsError({@required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
