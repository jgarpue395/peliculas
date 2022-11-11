import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {

  final String _baseUrl = "api.themoviedb.org";
  final String _apiKey = "569edcbfc777aa56e943b99176d26d79";
  final String _language = "es-ES";

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    print("MoviesProvider inicializado");
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', 
    {
     "api_key" : _apiKey,
     "language" : _language,
     "page" : "1"
    });

    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }
}