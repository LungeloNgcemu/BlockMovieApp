import 'dart:convert';
import 'movie_model.dart';

class MoviesResponse {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  const MoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MoviesResponse.fromJson(Map<String, dynamic> json) {
    return MoviesResponse(
      page: json['page'] ?? 0,
      results: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e))
          .toList(),
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'page': page,
        'results': results.map((e) => e.toJson()).toList(),
        'total_pages': totalPages,
        'total_results': totalResults,
      };

  /// Optional: Parse directly from raw JSON string
  factory MoviesResponse.fromRawJson(String str) =>
      MoviesResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
}
