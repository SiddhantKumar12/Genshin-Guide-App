import 'dart:io';

import 'package:dio/dio.dart';

String handleDioError(DioException error) {
  if (error.error is SocketException) {
    return "MyWrittenText.noInternet";
  }
  switch (error.type) {
    case DioExceptionType.cancel:
      return 'Request was cancelled';
    case DioExceptionType.connectionTimeout:
      return 'Connection timeout occurred';
    case DioExceptionType.sendTimeout:
      return 'Request timed out while sending data';
    case DioExceptionType.receiveTimeout:
      return 'Request timed out while receiving data';
    case DioExceptionType.unknown:
      return 'Unknown Error';
    case DioExceptionType.badCertificate:
      return 'Invalid Certificate';
    case DioExceptionType.connectionError:
      return 'Connection Error';
    default:
      return 'Unhandled DioExceptionType: ${error.type}';
  }
}
