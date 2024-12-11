import 'package:geolocator/geolocator.dart';


class LocationService
{
  Future <Position> getCurrentPosition()  async
  {
    try
    {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled)
      {
        throw Exception('El servicio de ubicación está desactivado.');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied)
      {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied)
        {
          throw Exception('El usuario denegó los permisos de ubicación.');
        }
      }

      if (permission == LocationPermission.deniedForever)
      {
        throw Exception('El usuario denegó los permisos de ubicación de forma permanente.');
      }

      final LocationSettings locationSettings = LocationSettings(accuracy: LocationAccuracy.high, distanceFilter: 100,);

      Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings,);
      return position;
    }
    catch (e)
    {
      print('Error al obtener la ubicación: $e');
      rethrow;
    }
  }
}