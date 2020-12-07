import 'package:flutter/material.dart';

class NetworkException implements Exception {
  final String message;
  NetworkException({@required this.message});
}
