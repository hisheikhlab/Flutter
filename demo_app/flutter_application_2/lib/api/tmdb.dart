import 'dart:convert';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/models/movieModel.dart';
import 'package:http/http.dart' as http;

class Api {
  static const popular_url =
      "https://api.themoviedb.org/3/movie/popular?api_key=${Constants.api_key}";
  static const toprated_url =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.api_key}";
  static const upcoming_url =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.api_key}";

  Future<List<moviesModel>> get_popular() async {
    List<moviesModel> popularMovies = [];
    int total_pages = 1;
    int current_page = 1;
    while (current_page <= total_pages) {
      List<moviesModel> movies_OnPage = [];
      final response =
          await http.get(Uri.parse("${popular_url}&page=${current_page}"));
      if (response.statusCode == 200) {
        final decoded = json.decode(response.body)['results'] as List;
        // total_pages = json.decode(response.body)['total_pages'];
        total_pages = 5;
        movies_OnPage =
            decoded.map((movie) => moviesModel.fromJson(movie)).toList();
      } else {
        throw Exception('404');
      }
      current_page++;
      popularMovies.addAll(movies_OnPage);
    }
    return popularMovies;
  }

  Future<List<moviesModel>> get_toprated() async {
    List<moviesModel> topratedMovies = [];
    int current_page = 1;
    int total_pages = 1;
    while (current_page <= total_pages) {
      List<moviesModel> movies_OnPage = [];
      final response =
          await http.get(Uri.parse("${toprated_url}&page=${current_page}"));
      if (response.statusCode == 200) {
        final decoded = json.decode(response.body)['results'] as List;
        // total_pages = json.decode(response.body)['total_pages'];
        total_pages = 3;
        movies_OnPage = decoded.map((e) => moviesModel.fromJson(e)).toList();
      } else {
        throw Exception('404');
      }
      current_page++;
      topratedMovies.addAll(movies_OnPage);
    }
    return topratedMovies;
  }

  Future<List<moviesModel>> get_upcoming() async {
    List<moviesModel> upcomingMovies = [];
    int current_page = 1;
    int total_pages = 1;
    while (current_page <= total_pages) {
      List<moviesModel> movies_OnPage = [];
      final response =
          await http.get(Uri.parse("${upcoming_url}&page=${current_page}"));
      if (response.statusCode == 200) {
        final decoded = json.decode(response.body)['results'] as List;
        movies_OnPage = decoded.map((e) => moviesModel.fromJson(e)).toList();
      } else {
        throw Exception('404');
      }
      current_page++;
      upcomingMovies.addAll(movies_OnPage);
    }
    return upcomingMovies;
  }
}
