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
