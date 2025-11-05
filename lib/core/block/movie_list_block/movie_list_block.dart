import 'package:block_movie_app/core/block/movie_list_block/movie_list_event.dart';
import 'package:block_movie_app/core/block/movie_list_block/movie_list_state.dart';
import 'package:block_movie_app/core/services/movie_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final MovieService _movieService;

  MovieListBloc(this._movieService)
      : super(MovieListState(movies: [], isLoading: false)) {
    on<FetchMovies>(_fetchMovies);
  }

  Future<void> _fetchMovies(
      FetchMovies event, Emitter<MovieListState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _movieService.getMoviesResponse();

      emit(state.copyWith(movies: response?.results, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
