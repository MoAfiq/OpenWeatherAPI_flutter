import 'package:flutter/material.dart';

import '../models/weather_models.dart';

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({required this.weatherModel, Key? key})
      : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      child: Container(
        width: 400,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.orange,
              Colors.red,
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.network(
              'https://openweathermap.org/img/w/${weatherModel.weather.first.icon}.png',
            ),
            const SizedBox(
              height: 10,
            ),
            Text('${weatherModel.main.temp.toInt() - 273} °C'),
            const SizedBox(
              height: 10,
            ),
            Text('${weatherModel.name}'),
            const SizedBox(
              height: 10,
            ),
            Text('${weatherModel.weather.first.description}'),
            const SizedBox(
              height: 10,
            ),
            Text('${weatherModel.main.pressure} millibars'),
            const SizedBox(
              height: 10,
            ),
            Text('${weatherModel.id} millibars'),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
