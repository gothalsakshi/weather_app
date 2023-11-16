import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit/weather_cubit.dart';

class DataViewScreen extends StatelessWidget {
  const DataViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black,
        body: BlocBuilder<WeatherCubit, WeatherState>(builder: (ctx, state) {
      if (state is WeatherSuccessState) {
        return Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('${state.weatherDataModel.name}',style: const TextStyle(
              fontSize: 30,color: Colors.purple,fontWeight: FontWeight.bold
            )),
            Text('${state.weatherDataModel.weather![0].description}',
            style:  TextStyle(
              fontSize: 25,color: Colors.purple.shade300,fontWeight: FontWeight.bold
            )),
            Text('${state.weatherDataModel.main!.tempMax}',
            style: TextStyle(
              fontSize: 20,color: Colors.purple.shade200,fontWeight: FontWeight.bold
            )),
            Text('${state.weatherDataModel.main!.tempMin}',
            style: TextStyle(
              fontSize: 20,color: Colors.purple.shade200,fontWeight: FontWeight.bold
            )),
          ],
        ));
      } else {
        return Container(
          height: 100,
          width: 100,
          color: Colors.deepPurple,
        );
      }
    }));
  }
}
