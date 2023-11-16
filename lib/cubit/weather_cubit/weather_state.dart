part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState{}

class WeatherSuccessState extends WeatherState{
  final WeatherData weatherDataModel;

  WeatherSuccessState({required this.weatherDataModel});
}

class WeatherErrorState extends WeatherState{
  final String error;
  WeatherErrorState({required this.error});
}
