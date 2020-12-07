import 'package:tcf_dio/src/exceptions/network_exception.dart';
import 'package:tcf_dio/src/key/key.dart';
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
    'Authorization': Keys.Key,
    'Content-Type': 'application/json'
  };

  /// defines the base url
  final String _base = 'https://api.sugarwod.com/v2';

  /// gets a list of all athletes
  Future<Athletes> getAthletes() async {
    try {
      var body = await this.get(
        query: '/athletes',
        base: _base,
        headers: _headers,
      );

      return athletesFromJson(body);
    } catch (e) {
      throw (NetworkException(message: e.toString()));
    }
  }

  /// gets the affiliate (box) info
  Future<Box> getAffiliate() async {
    try {
      var body = await this.get(
        query: '/box',
        base: _base,
        headers: _headers,
      );

      return boxFromJson(body);
    } catch (e) {
      throw (NetworkException(message: e.toString()));
    }
  }

  /// gets a list of barbell lifts
  Future<BarbellLifts> getBarbellLifts() async {
    try {
      var body = await this.get(
        query: '/barbelllifts',
        base: _base,
        headers: _headers,
      );

      return barbellLiftsFromJson(body);
    } catch (e) {
      throw (NetworkException(message: e.toString()));
    }
  }

  /// returns a single of Barbell Lift.
  Future<BarbellLift> getBarbellLiftById(String id) async {
    try {
      var body = await this.get(
        query: '/barbelllifts/$id',
        base: _base,
        headers: _headers,
      );

      return barbellLiftFromJson(body);
    } catch (e) {
      throw (NetworkException(message: e.toString()));
    }
  }

  /// returns a list of Barbell Lifts in the specified category., 'clean', 'deadlift'
  Future<BarbellLifts> getBarbellLiftByCategory(String category) async {
    try {
      var body = await this.get(
        query: '/barbelllifts/$category',
        base: _base,
        headers: _headers,
      );

      return barbellLiftsFromJson(body);
    } catch (e) {
      throw (NetworkException(message: e.toString()));
    }
  }

  /// returns a list of Benchmarks in the specified category. 'heroes', 'girls', 'games'
  Future<Benchmarks> getBenchmarksByCategory(String category) async {
    try {
      var body = await this.get(
        query: '/benchmarks/category/$category',
        base: _base,
        headers: _headers,
      );

      return benchMarksByCategoryFromJson(body);
    } catch (e) {
      throw (NetworkException(message: e.toString()));
    }
  }

  /// returns a single Benchmark
  Future<Benchmark> getBenchmarkById(String id) async {
    try {
      var body = await this.get(
        query: '/benchmarks/$id',
        base: _base,
        headers: _headers,
      );

      return benchMarkFromJson(body);
    } catch (e) {
      throw (NetworkException(message: e.toString()));
    }
  }

  /// returns a single of Movement.
  Future<Movement> getMovementById(String id) async {
    try {
      var body = await this.get(
        query: '/movements/$id',
        base: _base,
        headers: _headers,
      );

      return movementFromJson(body);
    } catch (e) {
      throw (NetworkException(message: e.toString()));
    }
  }

  /// returns a list of movements
  Future<Movements> getMovements() async {
    try {
      var body = await this.get(
        query: '/movements',
        base: _base,
        headers: _headers,
      );

      return movementsFromJson(body);
    } catch (e) {
      throw (NetworkException(message: e.toString()));
    }
  }

  /// gets a list of athletes for the supplied workout id
  Future<Athletes> getAthletesForThisWorkout(String id) async {
    try {
      var body = await this.get(
        query: '/workouts/$id/athletes',
        base: _base,
        headers: _headers,
      );

      return athletesFromJson(body);
    } catch (e) {
      throw (NetworkException(message: e.toString()));
    }
  }

  /// retrieve a list of Workouts.
  Future<Workouts> getWorkouts() async {
    try {
      var body = await this.get(
        query: '/workouts',
        base: _base,
        headers: _headers,
      );

      return workoutsFromJson(body);
    } catch (e) {
      throw (NetworkException(message: e.toString()));
    }
  }

  /// retrieve a Workout.
  Future<Workout> getWorkout(String id) async {
    try {
      var body = await this.get(
        query: '/workouts/$id',
        base: _base,
        headers: _headers,
      );

      return workoutFromJson(body);
    } catch (e) {
      throw (NetworkException(message: e.toString()));
    }
  }

  /// retrieve a list of Workouts. Optionally, filter by dates or track_id.
  /// dates can be a singular date_int or a range separated with a hyphen (7 day limit).
  /// default is "today".
  /// if no track_id is given, defaults to "all".
  Future<Workouts> getWorkoutsByDate(String date) async {
    try {
      var body = await this.get(
        query: '/workouts?dates=$date',
        base: _base,
        headers: _headers,
      );

      return workoutsFromJson(body);
    } catch (e) {
      throw (NetworkException(message: e.toString()));
    }
  }

  /// retrieve a list of Workouts. Optionally, filter by dates or track_id.
  /// dates can be a singular date_int or a range separated with a hyphen (7 day limit).
  /// default is "today".
  /// if no track_id is given, defaults to "all".
  Future<Workouts> getWorkoutsByDateRange(
      String fromDate, String toDate) async {
    try {
      var body = await this.get(
        query: '/workouts?dates=$fromDate-$toDate',
        base: _base,
        headers: _headers,
      );

      return workoutsFromJson(body);
    } catch (e) {
      throw (NetworkException(message: e.toString()));
    }
  }

  /// If no track_id is given, defaults to "all".
  Future<Workouts> getWorkoutsByTrack(String trackId) async {
    try {
      var body = await this.get(
        query: '/workouts?track_id=$trackId',
        base: _base,
        headers: _headers,
      );

      return workoutsFromJson(body);
    } catch (e) {
      throw (NetworkException(message: e.toString()));
    }
  }

  /// retrieve a list of Workouts. Optionally, filter by dates or track_id.
  /// dates can be a singular date_int or a range separated with a hyphen (7 day limit).
  /// default is "today".
  /// If no track_id is given, defaults to "all".
  Future<Workouts> getWorkoutsByDateAndTrack(
      String date, String trackId) async {
    try {
      var body = await this.get(
        query: '/workouts?date=$date&track_id=$trackId',
        base: _base,
        headers: _headers,
      );

      return workoutsFromJson(body);
    } catch (e) {
      throw (NetworkException(message: e.toString()));
    }
  }

  /// retrieve a list of Workouts. Optionally, filter by dates or track_id.
  /// dates can be a singular date_int or a range separated with a hyphen (7 day limit).
  /// default is "today".
  /// If no track_id is given, defaults to "all".
  Future<Workouts> getWorkoutsByDateRangeAndTrack(
      String toDate, String fromDate, String trackId) async {
    try {
      var body = await this.get(
        query: '/workouts?date=$toDate-$fromDate&track_id=$trackId',
        base: _base,
        headers: _headers,
      );

      return workoutsFromJson(body);
    } catch (e) {
      throw (NetworkException(message: e.toString()));
    }
  }
}
