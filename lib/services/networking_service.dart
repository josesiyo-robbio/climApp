
import 'dart:convert';
import 'package:http/http.dart' as http;


class NetworkService
{
  NetworkService(this.url);
  late final String url;

  Future<dynamic> getData()
  async
  {
    try
    {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200)
      {
        var data = jsonDecode(response.body);
        print('Datos del clima: $data');
        return data;
      }
      else
      {
        print('Error al obtener los datos del clima: ${response.statusCode}');
      }
    }
    catch (e)
    {
      print('Error al realizar la solicitud HTTP: $e');
    }

  }


}