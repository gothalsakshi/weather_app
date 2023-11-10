import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/service/weather_service.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  Future<void> callWeatherApi()async{
    WeatherService weatherService = WeatherService();
    emit(WeatherLoadingState());
    await weatherService.getLatLonData('Goa');
    emit(WeatherSuccessState());
  }
}
