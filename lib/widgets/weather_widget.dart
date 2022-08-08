import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/weather_models.dart';

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({required this.weatherModel, Key? key})
      : super(key: key);

  final WeatherModel weatherModel;

  // String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  String allWordsCapitilize(String str) {
    return str.toLowerCase().split(' ').map((word) {
      String leftText = (word.length > 1) ? word.substring(1, word.length) : '';
      return word[0].toUpperCase() + leftText;
    }).join(' ');
  }

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
              Color(0xff1C2A36),
              Color(0xff2D3948),
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20.0, left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        child: Text(
                          '${weatherModel.name}',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              '${weatherModel.main.temp.toInt() - 273}°',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 40,
                                  color: Colors.white),
                            ),
                          ),
                          // Image.network(
                          //   width: 70,
                          //   'https://openweathermap.org/img/w/${weatherModel.weather.first.icon}.png',
                          // ),
                        ],
                      ),
                      // Text(
                      //   'Feels like ${weatherModel.main.feelsLike.toInt() - 273}°',
                      //   style: const TextStyle(
                      //       fontSize: 12,
                      //       color: Colors.white,
                      //       fontWeight: FontWeight.w300),
                      // ),
                      Container(
                        margin: EdgeInsets.only(bottom: 30.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 8,
                              color: Color(0xff353361),
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Text(
                          allWordsCapitilize(
                              '${weatherModel.weather.first.description}'),
                          style: TextStyle(
                              fontFamily: 'RobotoMono',
                              fontSize: 14,
                              backgroundColor: Color(0xff353361),
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.water_drop,
                      color: Color(0xff6483B1),
                    ),
                    Text(
                      '${weatherModel.main.humidity}%',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.heat_pump,
                      color: Color(0xff6483B1),
                    ),
                    Text(
                      '${weatherModel.main.pressure} millibars',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.wind_power,
                      color: Color(0xff6483B1),
                    ),
                    Text(
                      '${(weatherModel.wind.speed * 3.6).toDouble().toStringAsFixed(2)} km/h',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            Image.network(
              width: 120,
              'https://openweathermap.org/img/w/${weatherModel.weather.first.icon}.png',
            ),
            SvgPicture.asset('droplet.svg')
          ],
        ),
      ),
    );
  }
}
