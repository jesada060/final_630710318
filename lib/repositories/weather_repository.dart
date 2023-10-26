import 'dart:convert';

import 'package:final_630710318/services/api_caller.dart';

class WeatherRepository {
  Future<Map<String, dynamic>> getData(String city) async {
    try {
      var result = await ApiCaller().get(city);
      Map<String, dynamic> data = jsonDecode(result);
      return data;
    } catch (e) {
      // TODO:
      rethrow;
    }
  }
}