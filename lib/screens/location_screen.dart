import 'package:climapp/services/weather_service.dart';
import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class LocationScreen extends StatefulWidget
{
  final locationWeather;
  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen>
{
  WeatherModel weatherModel = WeatherModel();
  late int temp = 0;
  late int condition = 0;
  late int temperature = 0;
  late String cityName = '';
  late String weatherIcon = '';
  late String weatherMessage = '';
  late String weatherCity = '';

  @override
  void initState()
  {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI (dynamic weatherData)
  {
    setState(() {
      print('Weather Data: $weatherData');

      double temp =  weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      var cityName =weatherData['name'];
      weatherCity = cityName;
      print('temperaTURAXXX $temp');

      weatherIcon=weatherModel.getWeatherIcon(condition);
      weatherMessage =  weatherModel.getMessage(temperature);

    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature °',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMessage in $weatherCity',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
