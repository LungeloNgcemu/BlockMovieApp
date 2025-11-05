import 'package:block_movie_app/core/block/movie_details_block/movie_details_event.dart';
import 'package:block_movie_app/core/block/movie_details_block/movie_details_state.dart';
import 'package:block_movie_app/core/services/movie_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieService _movieService;
  final String _id;

  MovieDetailsBloc({
    required MovieService movieService,
    required String id,
  })  : _movieService = movieService,
        _id = id,
        super(MovieDetailsState()) {
    on<FetchMovieDetails>(_fetchMovieDetails);
    add(FetchMovieDetails());
  }

  Future<void> _fetchMovieDetails(
      FetchMovieDetails event, Emitter<MovieDetailsState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _movieService.getMovieById(id: _id);

      emit(state.copyWith(
          title: response?.title,
          overview: response?.overview,
          isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
