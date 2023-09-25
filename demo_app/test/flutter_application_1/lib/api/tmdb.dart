import 'package:flutter_application_1/models/moviemodl.dart';
import 'package:flutter_application_1/widgets/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static const _trendingurl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.Api_key}';
  static const _topratedurl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.Api_key}';
  static const _upcomingurl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.Api_key}';

  Future<List<Movie>> gettrending() async {
    final List<Movie> allmovies = [];
    int currentpage = 1;
    int totalpages = 1;
    while (currentpage <= totalpages) {
      final response =
          await http.get(Uri.parse('$_trendingurl&page=$currentpage'));
      if (response.statusCode == 200) {
        final decoded = json.decode(response.body)["results"] as List;
        // totalpages = json.decode(response.body)['total_pages'];
        totalpages = 2;
        // print(currentpage);
        // print('$_topratedurl&page=$currentpage');
        final moviesOnpage =
            decoded.map((movie) => Movie.fromJson(movie)).toList();
        allmovies.addAll(moviesOnpage);
      } else {
        throw Exception("404");
      }
      currentpage++;
    }
    return allmovies;
  }

  Future<List<Movie>> gettoprated() async {
    // print('gettoprated method called');
    final List<Movie> allmovies = [];
    int currentpage = 1;
    int totalpages = 1;
    while (currentpage <= totalpages) {
      final response =
          await http.get(Uri.parse('$_topratedurl&page=$currentpage'));
      if (response.statusCode == 200) {
        final decoded = json.decode(response.body)["results"] as List;
        // totalpages = json.decode(response.body)['total_pages'];
        totalpages = 2;
        // print(currentpage);
        // print('$_topratedurl&page=$currentpage');
        final moviesOnpage =
            decoded.map((movie) => Movie.fromJson(movie)).toList();
        allmovies.addAll(moviesOnpage);
      } else {
        throw Exception("404");
      }
      currentpage++;
    }
    return allmovies;
  }

  Future<List<Movie>> getupcoming() async {
    // print('gettoprated method called');
    final List<Movie> allmovies = [];
    int currentpage = 1;
    int totalpages = 1;
    while (currentpage <= totalpages) {
      final response =
          await http.get(Uri.parse('$_upcomingurl&page=$currentpage'));
      if (response.statusCode == 200) {
        final decoded = json.decode(response.body)["results"] as List;
        // totalpages = json.decode(response.body)['total_pages'];
        totalpages = 2;
        // print(currentpage);
        // print('$_topratedurl&page=$currentpage');
        final moviesOnpage =
            decoded.map((movie) => Movie.fromJson(movie)).toList();
        allmovies.addAll(moviesOnpage);
      } else {
        throw Exception("404");
      }
      currentpage++;
    }
    return allmovies;
  }
}
