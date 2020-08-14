import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../environment/environment.dart';

class PruebaService {
  // final String userAgent;
  // final http.Client _inner;

  // PruebaService(this.userAgent, this._inner);
  // PruebaService();

  // Future<http.StreamedResponse> send(http.BaseRequest request) {
  //   request.headers['user-agent'] = userAgent;
  //   return _inner.send(request);
  // }

  Future<http.Response> fetchAlbum() {
    return http.get('$server');
  }

  Future<http.Response> pokemons() async {
    http.Response response = await http.get('$server');
    return json.decode(response.body);
  }

  getPokemons() async {
    http.Response response = await http.get('$server');
    return json.decode(response.body);
  }
}
