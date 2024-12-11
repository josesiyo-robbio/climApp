

import 'package:climapp/screens/location_screen.dart';
import 'package:climapp/services/location_service.dart';
import 'package:climapp/services/networking_service.dart';
import 'package:climapp/widgets/spin_widget.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


const apiKey = '197dc5fbe2d88d2dbc8268813a162e93';

class LoadingScreen extends StatefulWidget
{
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
{
  @override
  initState()
  {
    super.initState();

    getLocation();
  }

  Future<Position?> getLocation() async {
    LocationService locationService = LocationService();
    try {
      Position position = await locationService.getCurrentPosition();
      print('Latitud: ${position.latitude}, Longitud: ${position.longitude}');

      final url =
          'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=197dc5fbe2d88d2dbc8268813a162e93';
      NetworkService networkService = NetworkService(url);
      var weatherData = await networkService.getData();

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen();
      } ));

      double temp;
      int condition;
      String cityName;

      return position;
    } catch (e) {
      print('Error al obtener la ubicación: $e');
    }
    return null;
  }




  @override
  Widget build(BuildContext context)
  {
    return     spinkit;
  }
}
