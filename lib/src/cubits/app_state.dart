part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  const AppState();
}

// Athletes
class AppInitial extends AppState {
  const AppInitial();
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

class AthletesNextLoading extends AppState {
  const AthletesNextLoading();
  @override
  List<Object> get props => [];
}

class AthletesNextLoaded extends AppState {
  final Athletes athletes;

  const AthletesNextLoaded({@required this.athletes});

  @override
  List<Object> get props => [athletes];
}

class AthletesNextError extends AppState {
  final String errorMessage;

  const AthletesNextError({@required this.errorMessage});

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

class BenchmarksLoading extends AppState {
  const BenchmarksLoading();
  @override
  List<Object> get props => [];
}

class BenchmarksLoaded extends AppState {
  final Benchmarks benchmarks;

  const BenchmarksLoaded({@required this.benchmarks});

  @override
  List<Object> get props => [benchmarks];
}

class BenchmarksError extends AppState {
  final String errorMessage;

  const BenchmarksError({@required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
