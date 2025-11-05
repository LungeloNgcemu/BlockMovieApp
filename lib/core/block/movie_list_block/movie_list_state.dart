import 'package:equatable/equatable.dart';
import 'package:block_movie_app/core/models/movie_model.dart';

class MovieListState extends Equatable {
  final bool isLoading;
  final List<Movie> movies;
  final String? error;

  const MovieListState({
    required this.movies,
    required this.isLoading,
    this.error,
  });

  MovieListState copyWith(
      {bool? isLoading, List<Movie>? movies, String? error}) {
    return MovieListState(
      isLoading: isLoading ?? this.isLoading,
      movies: movies ?? this.movies,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, movies, error];
}
