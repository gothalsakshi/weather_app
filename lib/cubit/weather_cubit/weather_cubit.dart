import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/model/lat_lon_model.dart';
import 'package:weather_app/model/weather_data_model.dart';
import 'package:weather_app/service/weather_service.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  final TextEditingController cityName = TextEditingController();
  Future<void> callWeatherApi()async{
    WeatherService weatherService = WeatherService();
    if(cityName.text.isNotEmpty){
      emit(WeatherLoadingState());
      LatLonModel data = await weatherService.getLatLonData(cityName.text);
      WeatherData weatherData = await weatherService.getWeatherData(data.lat, data.lon);
      cityName.clear();
      emit(WeatherSuccessState(weatherDataModel: weatherData));
    }else{
      emit(WeatherErrorState(error: 'Something went wrong'));
    }
  }

  void resetState(){
    emit(WeatherInitial());
  }
}
