import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit/weather_cubit.dart';
import 'package:weather_app/presentation/data_view_screen.dart';
// import 'package:weather_app/service/weather_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final weatherService = WeatherService();    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade100,
        title: Text(
          'Weather',
          style: TextStyle(fontSize: 20, color: Colors.purple.shade800),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BlocBuilder<WeatherCubit,WeatherState>(
              builder: (context, state) {
              if (state is WeatherErrorState  || state is WeatherSuccessState){
                return IconButton(onPressed: (){
              context.read<WeatherCubit>().resetState();
            }, icon: const Icon(Icons.refresh_outlined,size: 30,));
              }else{
                return const SizedBox();
              }
            }),
            const SizedBox(height: 40),
            TextFormField(
              controller: context.read<WeatherCubit>().cityName,
              enabled: true,
              decoration: InputDecoration(
                  enabled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.purple)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.purple)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.purple)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.purple)),
                  hintText: 'Please enter city name',
                  hintStyle: TextStyle(color: Colors.purple.shade100)),
            ),
            const SizedBox(height: 40),
            BlocBuilder<WeatherCubit, WeatherState>(
                // bloc: WeatherCubit(),
                builder: (ctx, state) {
                  if (state is WeatherLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }  else if(state is WeatherErrorState){
                    return Center(child: Text(state.error));
                  }else {
                    return InkWell(
                      onTap: () async {
                        if(context.read<WeatherCubit>().cityName.text.isNotEmpty){
                          await context.read<WeatherCubit>().callWeatherApi();
                          if (!context.mounted) return;
                          Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const DataViewScreen()));
                        }else{
                          debugPrint('clicked button');
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.purple.shade200,
                            borderRadius: BorderRadius.circular(15)),
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: const Center(
                            child: Text(
                          'Check Weather',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
