import 'package:dio/dio.dart';

import '../dio/dio_api_helper.dart';
import 'api_strings.dart';

class DetailService {
  final Dio dio = DioApi().sendRequest;

  Future<Map<String, dynamic>?> gCharacterDetailFetchData({required String cName}) async {
    try {
      Response response = await dio.get(ApiStrings.baseUrl + ApiStrings.characters + cName);
      return response.data;
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> artifactDetailFetchData({required String cName}) async {
    try {
      Response response = await dio.get(ApiStrings.baseUrl + ApiStrings.artifacts + cName);
      return response.data;
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> foodDetailFetchData({required String cName}) async {
    try {
      Response response = await dio.get(ApiStrings.baseUrl + ApiStrings.consumablesList + cName);
      return response.data;
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> domainDetailFetchData({required String cName}) async {
    try {
      Response response = await dio.get(ApiStrings.baseUrl + ApiStrings.domains + cName);
      return response.data;
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> elementDetailService({required String cName}) async {
    try {
      Response response = await dio.get(ApiStrings.baseUrl + ApiStrings.elements + cName);
      return response.data;
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> enemiesDetailService({required String cName}) async {
    try {
      Response response = await dio.get(ApiStrings.baseUrl + ApiStrings.enemies + cName);
      return response.data;
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> nationDetailFetchData({required String cName}) async {
    try {
      Response response = await dio.get(ApiStrings.baseUrl + ApiStrings.nations + cName);
      return response.data;
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> weaponDetailFetchData({required String cName}) async {
    try {
      Response response = await dio.get(ApiStrings.baseUrl + ApiStrings.weapons + cName);
      return response.data;
    } catch (error) {
      rethrow;
    }
  }
}
