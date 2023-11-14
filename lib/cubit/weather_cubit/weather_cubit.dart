import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/service/weather_service.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  final TextEditingController cityName = TextEditingController();
  Future<void> callWeatherApi(String city)async{
    WeatherService weatherService = WeatherService();
    if(city.isNotEmpty){
      emit(WeatherLoadingState());
      await weatherService.getLatLonData(city);
      cityName.clear();
      emit(WeatherSuccessState());
    }else{
      emit(WeatherErrorState(error: 'Something went wrong'));
    }
  }

  void resetState(){
    emit(WeatherInitial());
  }
}
