import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

mixin HttpProvider {
  final http.Client _client = http.Client();

  Future<String> getUrl(
      {@required String query, @required Map<String, String> headers}) async {
    var url = Uri.encodeFull("$query");
    http.Response response;

    try {
      response = await _client.get(url as Uri, headers: headers);
    } catch (e) {
      throw (Exception(e.toString()));
    }

    /// 200 - everything else
    if (response.statusCode == 200) {
      return response.body;
    }

    /// 401 easter egg
    /// Error codes in the 400 range contain a JSON response that describes the error.
    if (response.statusCode >= 400 && response.statusCode < 500) {
      throw Exception(response.body);
    }

    /// Error codes in the 500 range are not expected
    if (response.statusCode >= 500) {
      throw (Exception(response.reasonPhrase));
    }

    return null;
  }

  Future<String> get(
      {@required String base,
      @required String query,
      @required Map<String, String> headers}) async {
    var url = Uri.encodeFull("$base$query");
    http.Response response;

    try {
      response = await _client.get(url as Uri, headers: headers);
    } catch (e) {
      throw (Exception(e.toString()));
    }

    /// 200 - everything else
    if (response.statusCode == 200) {
      return response.body;
    }

    /// 401 easter egg
    /// Error codes in the 400 range contain a JSON response that describes the error.
    if (response.statusCode >= 400 && response.statusCode < 500) {
      throw Exception(response.body);
    }

    /// Error codes in the 500 range are not expected
    if (response.statusCode >= 500) {
      throw (Exception(response.reasonPhrase));
    }

    return null;
  }

  Future<String> post({
    @required String base,
    @required String query,
  }) async {
    var url = Uri.encodeFull("$base$query");
    http.Response response;

    try {
      response = await _client.post(url as Uri);
    } catch (e) {
      throw (Exception(e.toString()));
    }

    /// 201 - created (token) 200 - everything else
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }

    /// 401 easter egg
    /// Error codes in the 400 range contain a JSON response that describes the error.
    if (response.statusCode >= 400 && response.statusCode < 500) {
      throw Exception(response.body);
    }

    /// Error codes in the 500 range are not expected
    if (response.statusCode >= 500) {
      throw (Exception(response.reasonPhrase));
    }

    return null;
  }
}
