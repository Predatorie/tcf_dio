import 'package:tcf_dio/src/key/key.dart';
import 'package:tcf_dio/src/models/athletes.dart';
import 'package:tcf_dio/src/services/http_service.dart';

class ApiRespository with HttpProvider {
  /// defines out authorization header
  final Map<String, String> _headers = {
    'Authorization': Keys.Key,
    'Content-Type': 'application/json'
  };

  Future<Athletes> getAthletes() async {
    try {
      var body = await this.get(
        query: '/athletes',
        base: 'https://api.sugarwod.com/v2',
        headers: _headers,
      );

      return athletesFromJson(body);
    } catch (e) {
      throw (e);
    }
  }
}
