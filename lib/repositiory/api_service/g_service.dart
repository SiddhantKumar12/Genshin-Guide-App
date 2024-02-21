import 'dart:developer';
import 'package:dainsleif_journal/repositiory/dio/dio_api_helper.dart';
import 'package:dio/dio.dart';
import 'api_strings.dart';

class GService {
  final Dio dio = DioApi().sendRequest;

  Future<Map<String, dynamic>?> fetchData() async {
    try {
      Response response = await dio.get(ApiStrings.baseUrl);
      return response.data;
    } catch (error, stacktrace) {
      log("Exception occurred: $error stackTrace: $stacktrace");
      return null;
    }
  }
}
