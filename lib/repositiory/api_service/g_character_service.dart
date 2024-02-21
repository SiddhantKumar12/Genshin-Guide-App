import 'package:dainsleif_journal/repositiory/dio/dio_api_helper.dart';
import 'package:dio/dio.dart';
import 'api_strings.dart';

class GCharacterItems {
  final Dio dio = DioApi().sendRequest;

  Future<List<dynamic>?> fetchData({required String item}) async {
    try {
      Response response = await dio.get(ApiStrings.baseUrl + item);
      return response.data;
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      return null;
    }
  }
}
