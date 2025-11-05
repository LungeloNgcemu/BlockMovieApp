import 'dart:convert';

import 'package:block_movie_app/core/models/movie_details_model.dart';
import 'package:block_movie_app/core/models/movie_model.dart';
import 'package:block_movie_app/core/models/movie_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:block_movie_app/core/constants.dart/constants.dart';

class MovieService {
  Future<MoviesResponse?> getMoviesResponse({int page = 1}) async {
    final headers = {
      'Authorization': 'Bearer ${TMDBConstants.tmdbToken}',
      'Content-Type': 'application/json',
    };

    final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/discover/movie?api_key=${ApiConstants.apiKey}&page=$page'),
        headers: headers);

    if (response.statusCode == 200) {
      return MoviesResponse.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<MovieDetails?> getMovieById({required String id}) async {
    final headers = {
      'Authorization': 'Bearer ${TMDBConstants.tmdbToken}',
      'Content-Type': 'application/json',
    };

    final response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/movie/$id'),
        headers: headers);

    if (response.statusCode == 200) {
      return MovieDetails.fromJson(jsonDecode(response.body));
    }
    return null;
  }
}
