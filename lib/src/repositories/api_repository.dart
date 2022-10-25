import 'package:dartz/dartz.dart';
import 'package:tcf_dio/src/exceptions/failures.dart';
import 'package:tcf_dio/src/key/Key.dart';
import 'package:tcf_dio/src/models/affiliate.dart';
import 'package:tcf_dio/src/models/athletes.dart';
import 'package:tcf_dio/src/models/barbell_lift.dart';
import 'package:tcf_dio/src/models/barbell_lifts.dart';
import 'package:tcf_dio/src/models/benchmark.dart';
import 'package:tcf_dio/src/models/benchmarks.dart';
import 'package:tcf_dio/src/models/movement.dart';
import 'package:tcf_dio/src/models/movements.dart';
import 'package:tcf_dio/src/models/workout.dart';
import 'package:tcf_dio/src/models/workouts.dart';
import 'package:tcf_dio/src/services/http_service.dart';

class ApiRepository with HttpProvider {
  /// defines out authorization header
  final Map<String, String> _headers = {
    'Authorization': Keys.key,
    'Content-Type': 'application/json'
  };

  /// defines the base url
  final String _base = 'https://api.sugarwod.com/v2';

  /// gets a list of all athletes
  Future<Either<Failure, Athletes>> getAthletes() async {
    try {
      var body = await this.get(
        query: '/athletes?page[limit]=1000',
        base: _base,
        headers: _headers,
      );

      return Right(athletesFromJson(body));
    } catch (_) {
      return Left(NetworkFailure());
    }
  }

  /// gets the affiliate (box) info
  Future<Either<Failure, Box>> getAffiliate() async {
    try {
      var body = await this.get(
        query: '/box',
        base: _base,
        headers: _headers,
      );

      return Right(boxFromJson(body));
    } catch (_) {
      return Left(NetworkFailure());
    }
  }

  /// gets a list of barbell lifts
  Future<Either<Failure, BarbellLifts>> getBarbellLifts() async {
    try {
      var body = await this.get(
        query: '/barbelllifts',
        base: _base,
        headers: _headers,
      );

      return Right(barbellLiftsFromJson(body));
    } catch (_) {
      return Left(NetworkFailure());
    }
  }

  /// returns a single of Barbell Lift.
  Future<Either<Failure, BarbellLift>> getBarbellLiftById(String id) async {
    try {
      var body = await this.get(
        query: '/barbelllifts/$id',
        base: _base,
        headers: _headers,
      );

      return Right(barbellLiftFromJson(body));
    } catch (e) {
      return Left(NetworkFailure());
    }
  }

  /// returns a list of Barbell Lifts in the specified category., 'clean', 'deadlift'
  Future<Either<Failure, BarbellLifts>> getBarbellLiftByCategory(
      String category) async {
    try {
      var body = await this.get(
        query: '/barbelllifts/$category',
        base: _base,
        headers: _headers,
      );

      return Right(barbellLiftsFromJson(body));
    } catch (_) {
      return Left(NetworkFailure());
    }
  }

  /// returns a list of Benchmarks in the specified category. 'heroes', 'girls', 'games'
  Future<Either<Failure, Benchmarks>> getBenchmarksByCategory(
      String category) async {
    try {
      var body = await this.get(
        query: '/benchmarks/category/$category',
        base: _base,
        headers: _headers,
      );

      return Right(benchMarksByCategoryFromJson(body));
    } catch (_) {
      return Left(NetworkFailure());
    }
  }

  /// returns a single Benchmark
  Future<Either<Failure, Benchmark>> getBenchmarkById(String id) async {
    try {
      var body = await this.get(
        query: '/benchmarks/$id',
        base: _base,
        headers: _headers,
      );

      return Right(benchMarkFromJson(body));
    } catch (_) {
      return Left(NetworkFailure());
    }
  }

  /// returns a single of Movement.
  Future<Either<Failure, Movement>> getMovementById(String id) async {
    try {
      var body = await this.get(
        query: '/movements/$id',
        base: _base,
        headers: _headers,
      );

      return Right(movementFromJson(body));
    } catch (_) {
      return Left(NetworkFailure());
    }
  }

  /// returns a list of movements
  Future<Either<Failure, Movements>> getMovements() async {
    try {
      var body = await this.get(
        query: '/movements',
        base: _base,
        headers: _headers,
      );

      return Right(movementsFromJson(body));
    } catch (_) {
      return Left(NetworkFailure());
    }
  }

  /// gets a list of athletes for the supplied workout id
  Future<Either<Failure, Athletes>> getAthletesForThisWorkout(String id) async {
    try {
      var body = await this.get(
        query: '/workouts/$id/athletes',
        base: _base,
        headers: _headers,
      );

      return Right(athletesFromJson(body));
    } catch (_) {
      return Left(NetworkFailure());
    }
  }

  /// retrieve a list of Workouts.
  Future<Either<Failure, Workouts>> getWorkouts() async {
    try {
      var body = await this.get(
        query: '/workouts',
        base: _base,
        headers: _headers,
      );

      return Right(workoutsFromJson(body));
    } catch (_) {
      return Left(NetworkFailure());
    }
  }

  /// retrieve a Workout.
  Future<Either<Failure, Workout>> getWorkout(String id) async {
    try {
      var body = await this.get(
        query: '/workouts/$id',
        base: _base,
        headers: _headers,
      );

      return Right(workoutFromJson(body));
    } catch (_) {
      return Left(NetworkFailure());
    }
  }

  /// retrieve a list of Workouts. Optionally, filter by dates or track_id.
  /// dates can be a singular date_int or a range separated with a hyphen (7 day limit).
  /// default is "today".
  /// if no track_id is given, defaults to "all".
  Future<Either<Failure, Workouts>> getWorkoutsByDate(String date) async {
    try {
      var body = await this.get(
        query: '/workouts?dates=$date',
        base: _base,
        headers: _headers,
      );

      return Right(workoutsFromJson(body));
    } catch (_) {
      return Left(NetworkFailure());
    }
  }

  /// retrieve a list of Workouts. Optionally, filter by dates or track_id.
  /// dates can be a singular date_int or a range separated with a hyphen (7 day limit).
  /// default is "today".
  /// if no track_id is given, defaults to "all".
  Future<Either<Failure, Workouts>> getWorkoutsByDateRange(
      String fromDate, String toDate) async {
    try {
      var body = await this.get(
        query: '/workouts?dates=$fromDate-$toDate',
        base: _base,
        headers: _headers,
      );

      return Right(workoutsFromJson(body));
    } catch (_) {
      return Left(NetworkFailure());
    }
  }

  /// If no track_id is given, defaults to "all".
  Future<Either<Failure, Workouts>> getWorkoutsByTrack(String trackId) async {
    try {
      var body = await this.get(
        query: '/workouts?track_id=$trackId',
        base: _base,
        headers: _headers,
      );

      return Right(workoutsFromJson(body));
    } catch (_) {
      return Left(NetworkFailure());
    }
  }

  /// retrieve a list of Workouts. Optionally, filter by dates or track_id.
  /// dates can be a singular date_int or a range separated with a hyphen (7 day limit).
  /// default is "today".
  /// If no track_id is given, defaults to "all".
  Future<Either<Failure, Workouts>> getWorkoutsByDateAndTrack(
      String date, String trackId) async {
    try {
      var body = await this.get(
        query: '/workouts?date=$date&track_id=$trackId',
        base: _base,
        headers: _headers,
      );

      return Right(workoutsFromJson(body));
    } catch (_) {
      return Left(NetworkFailure());
    }
  }

  /// retrieve a list of Workouts. Optionally, filter by dates or track_id.
  /// dates can be a singular date_int or a range separated with a hyphen (7 day limit).
  /// default is "today".
  /// If no track_id is given, defaults to "all".
  Future<Either<Failure, Workouts>> getWorkoutsByDateRangeAndTrack(
      String toDate, String fromDate, String trackId) async {
    try {
      var body = await this.get(
        query: '/workouts?date=$toDate-$fromDate&track_id=$trackId',
        base: _base,
        headers: _headers,
      );

      return Right(workoutsFromJson(body));
    } catch (_) {
      return Left(NetworkFailure());
    }
  }
}
