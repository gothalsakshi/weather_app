import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/lat_lon_model.dart';
import 'package:weather_app/model/weather_data_model.dart';

class WeatherService{
  Future<dynamic> getLatLonData(String city)async{
    debugPrint('init of method called');
    final Uri uri = Uri(
      host: kApiHost,
      scheme: 'https',
      path: '/geo/1.0/direct',
      queryParameters: {
        'q' : city,
        'limit': kLimit,
        'appid' : appId
      });
      try{
        // debugPrint('try block called');
        // final http.Response response = await http.Client().get(uri);
        // final decodeData = jsonDecode(response.body);

        // debugPrint('here is response-->${decodeData.toString()}');
        // return decodeData;

        debugPrint('checking url-->${uri.toString()}');
        debugPrint('try block called');
        final http.Response response = await http.Client().get(uri);
        if(response.statusCode == 200){
          final decodeData = jsonDecode(response.body);
          final modelData = LatLonModel.fromJson(decodeData);
          LatLonModel latLonModel = modelData;
          debugPrint('checking the model data--->${modelData.toString()}');
          await getWeatherData(latLonModel);
          debugPrint('here is response-->${uri.toString()}');
          return decodeData;
        }
      }
      catch(e){
        debugPrint('catch block called');
        return e.toString();
      }
  }


  Future<dynamic> getWeatherData(LatLonModel latLonModel)async{
    final Uri uri = Uri(
      host: kApiHost,
      scheme: 'https',
      path: '/data/2.5/weather',
      queryParameters: {
        'lat': "${latLonModel.lat}",
        'lon': "${latLonModel.lon}",
        'limit': kLimit,
        'appid' : appId
      });
    
    try {
      debugPrint('checking second url-->${uri.toString()}');
      final http.Response response = await http.Client().get(uri);
      final decodeData = jsonDecode(response.body);
      final modelData = WeatherData.fromJson(decodeData);
      WeatherData weatherData = modelData;
      debugPrint('----------${weatherData.weather![0].icon}');
      return weatherData;
    } catch (e) {
      return e.toString();
    }
  }
}